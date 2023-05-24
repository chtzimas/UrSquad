//
//  HeroThumbnail.swift
//  UrSquad
//
//  Created by Christos Tzimas on 7/4/23.
//

import Foundation

struct HeroThumbnail: Decodable {
    let path: String?
    let type: String?
}

extension HeroThumbnail {
    enum CodingKeys: String, CodingKey {
        case path
        case type = "extension"
    }
}
