//
//  MockData.swift
//  UrSquad
//
//  Created by Christos Tzimas on 12/4/23.
//

import Foundation

struct MockData {
    static var squadHeroes = [
        Hero(
            name: "1-D Man",
            description: "Desc1",
            thumbnailPath: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784.jpg",
            isInSquad: true
        ),
        Hero(
            name: "2-D Man",
            description: "Desc2",
            thumbnailPath: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784.jpg",
            isInSquad: true
        ),
        Hero(
            name: "3-D Man",
            description: "Desc3",
            thumbnailPath: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784.jpg",
            isInSquad: true
        ),
        Hero(
            name: "4-D Man",
            description: "Desc4",
            thumbnailPath: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784.jpg",
            isInSquad: true
        ),
        Hero(
            name: "5-D Man",
            description: "Desc5",
            thumbnailPath: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784.jpg",
            isInSquad: true
        ),
        Hero(
            name: "6-D Man",
            description: "Desc5",
            thumbnailPath: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784.jpg",
            isInSquad: true
        ),
    ]

    static let squadHeroesToSave = [
        Hero(
            name: "Hulk",
            description: "",
            thumbnailPath: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784.jpg",
            isInSquad: true
        ),
        Hero(
            name: "Iceman",
            description: "",
            thumbnailPath: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784.jpg",
            isInSquad: true
        ),
    ]

    static let heroesToSave = [
        Hero(
            name: "Catwoman",
            description: "",
            thumbnailPath: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784.jpg",
            isInSquad: false
        ),
        Hero(
            name: "Wonderwoman",
            description: "",
            thumbnailPath: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784.jpg",
            isInSquad: false
        ),
    ]

    static var heroes = [
        Hero(
            name: "Abomination (Ultimate)",
            description: "Desc1",
            thumbnailPath: "http://i.annihil.us/u/prod/marvel/i/mg/b/40/image_not_available.jpg",
            isInSquad: false
        ),
        Hero(
            name: "Absorbing Man",
            description: "Desc1",
            thumbnailPath: "http://i.annihil.us/u/prod/marvel/i/mg/1/b0/5269678709fb7.jpg",
            isInSquad: false
        ),

        Hero(
            name: "Fireman",
            description: "Desc1",
            thumbnailPath: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784.jpg",
            isInSquad: true
        ),
        Hero(
            name: "Acidman",
            description: "Desc1",
            thumbnailPath: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784.jpg",
            isInSquad: true
        ),
        Hero(
            name: "Knifeman",
            description: "Desc1",
            thumbnailPath: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784.jpg",
            isInSquad: true
        ),
    ]

    static let apiHeroes = [
        ApiHero(
            id: 1,
            name: "Abomination (Ultimate)",
            description: "Desc",
            thumbnail: HeroThumbnail(
                path: "http://i.annihil.us/u/prod/marvel/i/mg/b/40/image_not_available",
                type: "jpg"
            )
        ),
        ApiHero(
            id: 2,
            name: "Absorbing Man",
            description: "Desc2",
            thumbnail: HeroThumbnail(
                path: "http://i.annihil.us/u/prod/marvel/i/mg/1/b0/5269678709fb7",
                type: "png"
            )
        ),
    ]
}
