//
//  HeroLocalRepositoryProtocol.swift
//  UrSquad
//
//  Created by Christos Tzimas on 12/4/23.
//

import Foundation

protocol HeroLocalRepositoryProtocol {
    func save(fileNamed: String, heroes: [Hero])
    func read(fileNamed: String) -> [Hero]?
}
