//
//  UrSquadApp.swift
//  UrSquad
//
//  Created by Christos Tzimas on 7/4/23.
//

import SwiftUI

let isRunningUITests = ProcessInfo.processInfo.arguments.contains("isRunningUITests")

@main
struct UrSquadApp: App {
    private let isRunningUnitTests = ProcessInfo.processInfo.environment["XCTestConfigurationFilePath"] != nil

    var body: some Scene {
        WindowGroup {
            if !isRunningUnitTests && !isRunningUnitTests {
                MainView()
            }
        }
    }
}
