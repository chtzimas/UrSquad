//
//  MainViewModelTests.swift
//  UrSquadTests
//
//  Created by Christos Tzimas on 7/4/23.
//

import Factory
@testable import UrSquad
import XCTest

final class MainViewModelTests: XCTestCase {
    var sut: MainViewModel!

    func testIfSquadHeroesRetrieved() {
        Container.shared.heroLocalRepository.register {
            MockHeroLocalRepository()
        }
        sut = MainViewModel()
        sut.squadHeroes = MockData.squadHeroesToSave

        sut.squadHeroes = []
        sut.retrieveSquadHeroesIfNeeded()

        XCTAssertEqual(sut.squadHeroes, MockData.squadHeroes, "Saved squad heroes don't match with the displayed ones")
        XCTAssert(sut.attemptedToRetrieveSquadHeroes, "Didn't attempt to retrieve squad from disk")
        XCTAssertEqual(sut.squadHeroes, MockData.squadHeroes, "The displayed squad heroes do not match with the ones retrieved from disk")
    }

    func testIfHeroesRetrieved() {
        Container.shared.heroLocalRepository.register {
            MockHeroLocalRepository()
        }
        sut = MainViewModel()
        sut.heroes = MockData.heroesToSave

        sut.heroes = []
        sut.retrieveHeroesIfNeeded()

        XCTAssertEqual(sut.heroes, MockData.heroes, "Saved heroes don't match with the displayed ones")
        XCTAssert(sut.attemptedToRetrieveHeroes, "Didn't attempt to retrieve heroes from disk")
        XCTAssertEqual(sut.heroes, MockData.heroes, "The displayed heroes do not match with the ones retrieved from disk")
    }

    func testFetchHeroesIfNeeded() async {
        Container.shared.heroWebRepository.register {
            MockHeroWebRepository()
        }
        sut = MainViewModel()

        await sut.fetchHeroesIfNeeded()

        XCTAssert(sut.state == .heroesFetched, "Didn't attempt to fetch heroes")
        XCTAssertEqual(sut.apiHeroes, MockData.apiHeroes, "The displayed heroes do not match with the ones fetched from api")
    }

    func testIfApiHeroesMappedProperly() async {
        Container.shared.heroWebRepository.register {
            MockHeroWebRepository()
        }
        sut = MainViewModel()

        await sut.fetchHeroesIfNeeded()

        XCTAssertEqual(sut.heroes.count, 2)

        XCTAssertEqual(sut.heroes[0].name, MockData.apiHeroes[0].name!, "Api hero and mapped hero names don't match")
        XCTAssertEqual(sut.heroes[0].description, MockData.apiHeroes[0].description!, "Api hero and mapped hero descriptions don't match")
        XCTAssertEqual(sut.heroes[0].thumbnailPath, MockData.apiHeroes[0].path, "Api hero and mapped hero thumbnail paths don't match")

        XCTAssertEqual(sut.heroes[1].name, MockData.apiHeroes[1].name!, "Api hero and mapped hero names don't match")
        XCTAssertEqual(sut.heroes[1].description, MockData.apiHeroes[1].description!, "Api hero and mapped hero descriptions don't match")
        XCTAssertEqual(sut.heroes[1].thumbnailPath, MockData.apiHeroes[1].path, "Api hero and mapped hero thumbnail paths don't match")
    }
}
