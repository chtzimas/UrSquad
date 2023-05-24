//
//  HeroesResponseData.swift
//  UrSquad
//
//  Created by Christos Tzimas on 7/4/23.
//

import Foundation

struct HeroesResponseData: Decodable {
    let heroes: [ApiHero]?
}

extension HeroesResponseData {
    enum CodingKeys: String, CodingKey {
        case heroes = "results"
    }
}
