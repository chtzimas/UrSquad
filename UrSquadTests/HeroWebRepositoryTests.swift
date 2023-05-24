//
//  HeroWebRepositoryTests.swift
//  UrSquadTests
//
//  Created by Christos Tzimas on 13/4/23.
//

import Foundation
@testable import UrSquad
import XCTest

class HeroWebRepositoryTests: XCTestCase {
    private var sut = {
        let configuration = URLSessionConfiguration.ephemeral
        configuration.protocolClasses = [MockURLProtocol.self]
        let urlSession = URLSession(configuration: configuration)
        return HeroWebRepository(urlSession: urlSession)
    }()

    func testIfFetchHeroValid() async throws {
        let mockData = Bundle.stubbedDataFromJson(filename: "StubApiHeroes")
        let mockHeroesResponse = try JSONDecoder().decode(HeroesResponse.self, from: mockData)
        MockURLProtocol.requestHandler = { _ in
            (HTTPURLResponse(), mockData)
        }

        let heroes = try await sut.fetchHeroes()

        XCTAssertEqual(heroes, mockHeroesResponse.data?.heroes, "Didn't fetch the correct heroes from the api")
    }

    func testFetchHeroWithInvalidJson() async throws {
        let mockData = "{\"\"123data123\"\"\"\"\"}".data(using: .utf8)!
        MockURLProtocol.requestHandler = { _ in
            (HTTPURLResponse(), mockData)
        }

        do {
            let heroes = try await sut.fetchHeroes()
            XCTAssertEqual(heroes, nil, "Fetched heroes should be nil with invalid json")
        } catch {
            XCTAssertEqual(error.localizedDescription, ApiError.decoding.localizedDescription, "The error should be have ApiError.decoding value")
        }
    }
}
