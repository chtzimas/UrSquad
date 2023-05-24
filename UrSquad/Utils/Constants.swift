//
//  Constants.swift
//  UrSquad
//
//  Created by Christos Tzimas on 7/4/23.
//

import Foundation

enum Constants {
    enum Api {
        static let url = URL(string: "http://gateway.marvel.com/v1/public/characters")

        enum QueryKey: String {
            case timestamp = "ts"
            case publicKey = "apikey"
            case hash
        }

        enum QueryValue {
            static let timestamp = "1"
            static let apiKey = "71e742407ca8b4ac76c4917a1c199a09"
            static let hash = "0ede76a68053734096d48f6fc5c75d0b"
        }
    }
}
