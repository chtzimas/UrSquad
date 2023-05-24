//
//  HeroLocalRepository.swift
//  UrSquad
//
//  Created by Christos Tzimas on 9/4/23.
//

import Foundation

class HeroLocalRepository: HeroLocalRepositoryProtocol {
    private let fileManager: FileManager

    init(fileManager: FileManager = .default) {
        self.fileManager = fileManager
    }

    private enum HeroesFileManagerError: Error {
        case invalidDirectory
        case writtingFailed
        case encodingFailed
        case decodingFailed
    }

    func save(fileNamed: String, heroes: [Hero]) {
        guard let url = makeURL(forFileNamed: fileNamed) else {
            debugPrint(HeroesFileManagerError.invalidDirectory)
            return
        }
        var data: Data?
        do {
            data = try JSONEncoder().encode(heroes)
        } catch {
            debugPrint(HeroesFileManagerError.encodingFailed)
        }
        do {
            try data?.write(to: url)
        } catch {
            debugPrint(HeroesFileManagerError.writtingFailed)
        }
    }

    func read(fileNamed: String) -> [Hero]? {
        guard let url = makeURL(forFileNamed: fileNamed) else {
            debugPrint(HeroesFileManagerError.invalidDirectory)
            return nil
        }
        if let data = try? Data(contentsOf: url) {
            do {
                return try JSONDecoder().decode([Hero].self, from: data)
            } catch {
                debugPrint(HeroesFileManagerError.decodingFailed)
            }
        }
        return nil
    }

    private func makeURL(forFileNamed fileName: String) -> URL? {
        guard let url = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else {
            return nil
        }
        return url.appendingPathComponent(fileName)
    }
}
