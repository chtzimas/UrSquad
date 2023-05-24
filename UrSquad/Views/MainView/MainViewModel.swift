//
//  MainViewModel.swift
//  UrSquad
//
//  Created by Christos Tzimas on 7/4/23.
//

import Factory
import Foundation
import SwiftUI

class MainViewModel: ObservableObject {
    @Injected(\.heroWebRepository) private var webRepository
    @Injected(\.heroLocalRepository) private var localRepository

    @Published var heroes = [Hero]() {
        didSet {
            saveHeroes()
        }
    }

    @Published var squadHeroes = [Hero]() {
        didSet {
            saveSquadHeroes()
        }
    }

    @Published var heroesFetchingState: State = .none

    @Published var showErrorAlert = false

    private(set) var state: State = .none {
        didSet {
            debugPrint(state)
        }
    }

    private(set) var attemptedToRetrieveSquadHeroes = false
    private(set) var attemptedToRetrieveHeroes = false
    private var attemptedToRetrieve: Bool {
        attemptedToRetrieveSquadHeroes && attemptedToRetrieveHeroes
    }

    private var shouldFetchHeroes: Bool {
        state != .heroesFetched &&
            state != .heroesRetrieved &&
            state != .squadRetrieved
    }

    private(set) var apiHeroes = [ApiHero]()

    enum State {
        case retrievingSquad
        case squadRetrieved
        case noSavedSquadFound
        case retrievingHeroes
        case heroesRetrieved
        case noSavedHeroesFound
        case fetchingHeroes
        case heroesFetched
        case fetchingHeroesFailed
        case none
    }

    private func saveHeroes() {
        localRepository.save(fileNamed: "Heroes", heroes: heroes)
    }

    private func saveSquadHeroes() {
        localRepository.save(fileNamed: "SquadHeroes", heroes: squadHeroes)
    }

    func retrieveSquadHeroesIfNeeded() {
        if !attemptedToRetrieve {
            retrieveSquad()
            attemptedToRetrieveSquadHeroes = true
        }
    }

    func retrieveHeroesIfNeeded() {
        if !attemptedToRetrieve {
            retrieveHeroes()
            attemptedToRetrieveHeroes = true
        }
    }

    private func retrieveSquad() {
        state = .retrievingSquad
        if let squadHeroes = localRepository.read(fileNamed: "SquadHeroes") {
            self.squadHeroes = squadHeroes
            state = .squadRetrieved
        } else {
            state = .noSavedSquadFound
        }
    }

    private func retrieveHeroes() {
        state = .retrievingHeroes
        if let heroes = localRepository.read(fileNamed: "Heroes") {
            self.heroes = heroes
            state = .heroesRetrieved
        } else {
            state = .noSavedHeroesFound
        }
    }

    func fetchHeroesIfNeeded() async {
        if shouldFetchHeroes {
            do {
                state = .fetchingHeroes
                await MainActor.run {
                    heroesFetchingState = state
                }
                apiHeroes = try await webRepository.fetchHeroes() ?? [ApiHero]()
                await MainActor.run {
                    self.heroes = mapHeroes(from: self.apiHeroes)
                }
                state = .heroesFetched
                await MainActor.run {
                    heroesFetchingState = state
                }
            } catch {
                state = .fetchingHeroesFailed
                await MainActor.run {
                    heroesFetchingState = state
                    showErrorAlert = true
                }
            }
        }
    }

    func getMockHeroes() {
        heroes = MockData.heroes
        squadHeroes = MockData.squadHeroes
    }

    private func mapHeroes(from apiHeroes: [ApiHero]) -> [Hero] {
        var heroes = [Hero]()
        apiHeroes.forEach {
            let hero = Hero(name: $0.name ?? "", description: $0.description ?? "", thumbnailPath: $0.path)
            heroes.append(hero)
        }
        return heroes.sorted { $0.name < $1.name }
    }
}
