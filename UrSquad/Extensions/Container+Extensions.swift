//
//  Container+Extensions.swift
//  UrSquad
//
//  Created by Christos Tzimas on 7/4/23.
//

import Factory
import Foundation

extension Container {
    var heroWebRepository: Factory<HeroWebRepositoryProtocol> {
        self {
            HeroWebRepository()
        }.shared
    }

    var heroLocalRepository: Factory<HeroLocalRepositoryProtocol> {
        self {
            HeroLocalRepository()
        }.shared
    }

    var heroImageProvider: Factory<HeroImageProviderProtocol> {
        self {
            if isRunningUITests {
                return MockHeroImageProvider()
            } else {
                return HeroImageProvider()
            }
        }.shared
    }
}
