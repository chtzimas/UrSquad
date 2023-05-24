//
//  HeroImageProvider.swift
//  UrSquad
//
//  Created by Christos Tzimas on 15/4/23.
//

import Foundation
import Kingfisher
import SwiftUI

class HeroImageProvider: HeroImageProviderProtocol {
    func getImage(from url: URL?, cropped: Bool) -> AnyView {
        return AnyView(
            KFImage(url)
                .resizable()
                .if(cropped) { view in
                    view
                        .scaledToFill()
                        .clipShape(Circle())
                        .frame(width: .xLarge, height: .xLarge)
                        .padding(.medium)
                }
        )
    }
}
