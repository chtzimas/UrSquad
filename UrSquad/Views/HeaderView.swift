//
//  HeaderView.swift
//  UrSquad
//
//  Created by Christos Tzimas on 7/4/23.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        VStack {
            Image(
                "MarvelLogo",
                bundle: Bundle(for: MainViewModel.self)
            )
            Divider()
                .overlay(Color.greyLight)
        }
        .padding(.bottom, .small)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
