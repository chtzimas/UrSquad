//
//  HeroRepository.swift
//  UrSquad
//
//  Created by Christos Tzimas on 7/4/23.
//

import Foundation

class HeroWebRepository: HeroWebRepositoryProtocol {
    private let urlSession: URLSession

    init(urlSession: URLSession = .shared) {
        self.urlSession = urlSession
    }

    func fetchHeroes() async throws -> [ApiHero]? {
        let endpoint = ApiConvertor.getHeroes
        let (data, response) = try await urlSession.data(for: endpoint.getUrlRequest())
        guard let response = (response as? HTTPURLResponse) else {
            throw ApiError.unknown
        }

        let statusCode = response.statusCode
        switch statusCode {
        case 200:
            do {
                let response: HeroesResponse = try JSONDecoder().decode(HeroesResponse.self, from: data)
                return response.data?.heroes
            } catch {
                throw ApiError.decoding
            }
        case 401, 403, 405, 409:
            throw ApiError.errorCode(statusCode)
        default:
            throw ApiError.unknown
        }
    }
}
