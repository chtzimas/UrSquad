//
//  ApiConvertor.swift
//  UrSquad
//
//  Created by Christos Tzimas on 7/4/23.
//

import Foundation

enum ApiConvertor {
    case getHeroes

    private static let sharedQuery: [Constants.Api.QueryKey: String] = [.timestamp: Constants.Api.QueryValue.timestamp, .publicKey: Constants.Api.QueryValue.apiKey, .hash: Constants.Api.QueryValue.hash]

    private var baseURL: URL? {
        Constants.Api.url
    }

    private var params: [Constants.Api.QueryKey: String] {
        let params: [Constants.Api.QueryKey: String] = ApiConvertor.sharedQuery
        return params
    }

    func getUrlRequest() throws -> URLRequest {
        guard let url = baseURL?.appendingParams(params: params) else {
            throw ApiError.invalidUrl
        }
        return URLRequest(url: url)
    }
}

private extension URL {
    func appendingParams(params: [Constants.Api.QueryKey: String]) -> URL? {
        var components = URLComponents(url: self, resolvingAgainstBaseURL: false)
        components?.queryItems = params.map { element in URLQueryItem(name: element.key.rawValue, value: element.value) }
        return components?.url
    }
}
