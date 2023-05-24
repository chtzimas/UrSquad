//
//  MainView.swift
//  UrSquad
//
//  Created by Christos Tzimas on 7/4/23.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var viewModel = MainViewModel()
    @State var alertDismissed = false

    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    HeaderView()
                    if !viewModel.squadHeroes.isEmpty {
                        SquadHeroesView(
                            heroes: $viewModel.heroes,
                            squadHeroes: $viewModel.squadHeroes
                        )
                    }
                    HeroesView(
                        heroes: $viewModel.heroes,
                        squadHeroes: $viewModel.squadHeroes
                    )
                    .padding(.top, .medium)
                    .onAppear {
                        if isRunningUITests {
                            viewModel.getMockHeroes()
                        } else {
                            viewModel.retrieveHeroesIfNeeded()
                            viewModel.retrieveSquadHeroesIfNeeded()
                            Task {
                                await viewModel.fetchHeroesIfNeeded()
                            }
                        }
                    }
                }
                .alert(isPresented: $viewModel.showErrorAlert) {
                    Alert(
                        title: Text(TextContent.apiErrorTitle),
                        message: Text(TextContent.apiErrorMessage),
                        dismissButton: .default(Text(TextContent.ok)) {
                            alertDismissed = true
                            viewModel.retrieveHeroesIfNeeded()
                            viewModel.retrieveSquadHeroesIfNeeded()
                            Task {
                                await viewModel.fetchHeroesIfNeeded()
                            }
                        }
                    )
                }
                if viewModel.heroesFetchingState == .fetchingHeroes {
                    ProgressView()
                        .tint(.redDark)
                }
            }
            .background(Color.greyDark)
        }
        .tint(.white)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
