//
//  SquadHeroesView.swift
//  UrSquad
//
//  Created by Christos Tzimas on 9/4/23.
//

import SwiftUI

struct SquadHeroesView: View {
    @Binding var heroes: [Hero]
    @Binding var squadHeroes: [Hero]

    var body: some View {
        Text(TextContent.mySquadTitle)
            .foregroundColor(.white)
            .font(.title3)
            .fontWeight(.semibold)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, .medium)
        ScrollView(.horizontal) {
            HStack(spacing: .small) {
                ForEach($squadHeroes) { squadHero in
                    NavigationLink(
                        destination: HeroDetailsView(
                            hero: squadHero,
                            heroes: $heroes,
                            squadHeroes: $squadHeroes
                        )
                        .toolbarBackground(.hidden, for: .navigationBar)
                        .toolbarRole(.editor)
                    ) {
                        SquadHeroView(
                            thumbnailPath: squadHero.wrappedValue.thumbnailPath,
                            name: squadHero.wrappedValue.name
                        )
                    }
                }
            }
            .padding(
                EdgeInsets(
                    top: .medium,
                    leading: .medium,
                    bottom: 0,
                    trailing: .medium
                )
            )
        }
        .frame(height: 120)
    }
}
