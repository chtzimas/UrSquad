//
//  Hero.swift
//  UrSquad
//
//  Created by Christos Tzimas on 7/4/23.
//

import Foundation
import SwiftUI

struct Hero: Codable, Equatable, Identifiable {
    let id = UUID()
    let name: String
    let description: String
    let thumbnailPath: String
    var isInSquad: Bool

    init(
        name: String,
        description: String,
        thumbnailPath: String,
        isInSquad: Bool = false
    ) {
        self.name = name
        self.description = description
        self.thumbnailPath = thumbnailPath
        self.isInSquad = isInSquad
    }

    static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.name == rhs.name &&
            lhs.description == rhs.description &&
            lhs.thumbnailPath == rhs.thumbnailPath
    }
}

extension Hero {
    enum CodingKeys: String, CodingKey {
        case name, description, thumbnailPath, isInSquad
    }
}
