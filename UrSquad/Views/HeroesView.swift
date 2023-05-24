//
//  HeroesView.swift
//  UrSquad
//
//  Created by Christos Tzimas on 9/4/23.
//

import SwiftUI

struct HeroesView: View {
    @Binding var heroes: [Hero]
    @Binding var squadHeroes: [Hero]

    var body: some View {
        ScrollView {
            LazyVStack(spacing: .medium) {
                ForEach($heroes) { hero in
                    NavigationLink(
                        destination: HeroDetailsView(
                            hero: hero,
                            heroes: $heroes,
                            squadHeroes: $squadHeroes
                        )
                        .toolbarBackground(.hidden, for: .navigationBar)
                        .toolbarRole(.editor)
                    ) {
                        HeroView(
                            thumbnailPath: hero.wrappedValue.thumbnailPath,
                            name: hero.wrappedValue.name
                        )
                    }
                }
            }
        }
    }
}
