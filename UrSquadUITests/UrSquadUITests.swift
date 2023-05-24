//
//  UrSquadUITests.swift
//  UrSquadUITests
//
//  Created by Christos Tzimas on 7/4/23.
//

import SnapshotTesting
import SwiftUI
import XCTest

final class UrSquadUITests: XCTestCase {
    func testMainView() {
        let view = MainView()
        assertSnapshot(matching: view.toVC(), as: .image)
    }

    func testHeaderView() {
        let view = HeaderView()
        assertSnapshot(matching: view.toVC(), as: .image)
    }

    func testSquadHeroView() {
        let view = SquadHeroView(thumbnailPath: "", name: "A-Bomb (HAS)")
        assertSnapshot(matching: view.toVC(), as: .image)
    }

    func testSquadHeroesView() {
        let view = SquadHeroesView(
            heroes: Binding.constant(MockData.heroes),
            squadHeroes: Binding.constant(MockData.squadHeroes)
        )
        assertSnapshot(matching: view.toVC(), as: .image)
    }

    func testHeroView() {
        let view = HeroView(thumbnailPath: "", name: "A-Bomb (HAS)")
        assertSnapshot(matching: view.toVC(), as: .image)
    }

    func testHeroesView() {
        let view = HeroesView(
            heroes: Binding.constant(MockData.heroes),
            squadHeroes: Binding.constant(MockData.squadHeroes)
        )
        assertSnapshot(matching: view.toVC(), as: .image)
    }

    func testSquadButtonViewRecruit() {
        let view = SquadButtonView(
            hero: Binding.constant(MockData.heroes[0]),
            squadHeroes: Binding.constant(MockData.squadHeroes),
            showAlert: Binding.constant(false)
        )
        assertSnapshot(matching: view.toVC(), as: .image)
    }

    func testSquadButtonViewFire() {
        let view = SquadButtonView(
            hero: Binding.constant(MockData.squadHeroes[0]),
            squadHeroes: Binding.constant(MockData.squadHeroes),
            showAlert: Binding.constant(false)
        )
        assertSnapshot(matching: view.toVC(), as: .image)
    }

    //    func testHeroDetailsView() {
    //        let view = HeroDetailsView(
    //            hero: Binding.constant(MockData.heroes[0]),
    //            heroes: Binding.constant(MockData.heroes),
    //            squadHeroes: Binding.constant(MockData.squadHeroes)
    //        )
    //        assertSnapshot(matching: view.toVC(), as: .image)
    //    }
}

private extension View {
    func toVC() -> UIViewController {
        let vc = UIHostingController(rootView: self)
        vc.view.frame = UIScreen.main.bounds
        return vc
    }
}
