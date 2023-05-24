//
//  HeroImageProvider.swift
//  UrSquad
//
//  Created by Christos Tzimas on 17/4/23.
//

import Foundation
import SwiftUI

class MockHeroImageProvider: HeroImageProviderProtocol {
    func getImage(from _: URL?, cropped: Bool) -> AnyView {
        AnyView(
            Image(
                "ABomb",
                bundle: Bundle(for: MainViewModel.self)
            )
            .resizable()
            .if(cropped) { view in
                view
                    .scaledToFill()
                    .clipShape(Circle())
                    .frame(width: .large, height: .large)
                    .padding(.medium)
            }
        )
    }
}
