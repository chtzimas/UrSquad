//
//  HeroWebRepositoryProtocol.swift
//  UrSquad
//
//  Created by Christos Tzimas on 12/4/23.
//

import Foundation

protocol HeroWebRepositoryProtocol {
    func fetchHeroes() async throws -> [ApiHero]?
}
