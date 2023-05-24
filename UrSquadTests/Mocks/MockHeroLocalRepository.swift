//
//  MockHeroLocalRepository.swift
//  UrSquad
//
//  Created by Christos Tzimas on 12/4/23.
//

import Foundation

class MockHeroLocalRepository: HeroLocalRepositoryProtocol {
    private let fileManager: FileManager

    init(fileManager: FileManager = .default) {
        self.fileManager = fileManager
    }

    func save(fileNamed _: String, heroes _: [Hero]) {}

    func read(fileNamed: String) -> [Hero]? {
        if fileNamed == "Heroes" {
            return MockData.heroes
        } else if fileNamed == "SquadHeroes" {
            return MockData.squadHeroes
        }
        return nil
    }
}
