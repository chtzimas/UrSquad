//
//  ApiError.swift
//  UrSquad
//
//  Created by Christos Tzimas on 7/4/23.
//

import Foundation

enum ApiError: LocalizedError {
    case invalidUrl
    case decoding
    case errorCode(Int)
    case unknown

    public var errorDescription: String? {
        switch self {
        case .invalidUrl:
            return "The API endpoint url is invalid."
        case .decoding:
            return "Failed to decode the data received from the API."
        case let .errorCode(code):
            return "\(code) - error code from API"
        case .unknown:
            return "Something went wrong. Please try again."
        }
    }
}
