//
//  ApiHero.swift
//  UrSquad
//
//  Created by Christos Tzimas on 7/4/23.
//

import Foundation

struct ApiHero: Equatable, Decodable {
    let id: Int?
    let name: String?
    let description: String?
    let thumbnail: HeroThumbnail?

    var path: String {
        if let path = thumbnail?.path, let type = thumbnail?.type {
            return path + "." + type
        }
        return ""
    }

    static func == (lhs: ApiHero, rhs: ApiHero) -> Bool {
        lhs.id == rhs.id
    }
}
