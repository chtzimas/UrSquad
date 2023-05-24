//
//  MockHeroWebRepository.swift
//  UrSquad
//
//  Created by Christos Tzimas on 12/4/23.
//

import Foundation

class MockHeroWebRepository: HeroWebRepositoryProtocol {
    func fetchHeroes() async throws -> [ApiHero]? {
        MockData.apiHeroes
    }
}
