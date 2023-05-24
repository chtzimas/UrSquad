//
//  HeroDetailsView.swift
//  UrSquad
//
//  Created by Christos Tzimas on 7/4/23.
//

import Factory
import Kingfisher
import ScrollKit
import SwiftUI

struct HeroDetailsView: View {
    @Injected(\.heroImageProvider) private var imageProvider
    @State var isShowingRecruitToSquadAlert = false
    @Binding var hero: Hero
    @Binding var heroes: [Hero]
    @Binding var squadHeroes: [Hero]

    var body: some View {
        ZStack {
            Color.greyDark
                .ignoresSafeArea()
            ScrollView {
                VStack {
                    ScrollViewHeader {
                        imageProvider.getImage(
                            from: URL(string: hero.thumbnailPath),
                            cropped: false
                        )
                    }
                    .aspectRatio(contentMode: .fill)
                    HStack {
                        Text(hero.name)
                            .foregroundColor(.white)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .padding(.horizontal, .medium)
                        Spacer()
                    }
                    SquadButtonView(
                        hero: $hero,
                        squadHeroes: $squadHeroes,
                        showAlert: $isShowingRecruitToSquadAlert
                    )
                    HStack {
                        Text(hero.description)
                            .foregroundColor(.white)
                            .font(.body)
                            .padding(.horizontal, .medium)
                        Spacer()
                    }
                }
            }
            .alert(isPresented: $isShowingRecruitToSquadAlert) {
                Alert(
                    title: Text(TextContent.fireFromSquadConfirmation),
                    message: Text(""),
                    primaryButton: .cancel(Text(TextContent.no)),
                    secondaryButton: .destructive(Text(TextContent.yes)) {
                        // i had to make a copy because app crashes with:
                        // "Swift/ContiguousArrayBuffer.swift:600: Fatal error: Index out of range",
                        // if we directly use hero in" firstIndex(where:)"
                        let selectedHero = hero
                        squadHeroes.removeAll(where: { $0 == hero })
                        if let index = heroes.firstIndex(where: { $0 == selectedHero }) {
                            heroes[index].isInSquad = false
                        }
                    }
                )
            }
            .ignoresSafeArea()
            VStack {
                Color.dimWhiteBackground
                    .frame(height: 45)
                    .ignoresSafeArea()
                Spacer()
            }
        }
    }
}

struct HeroDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        HeroDetailsView(
            hero: .constant(
                Hero(
                    name: "3-D Man",
                    description: "Beat y'all!",
                    thumbnailPath: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784.jpg"
                )
            ),
            heroes: .constant([]),
            squadHeroes: .constant([])
        )
    }
}
