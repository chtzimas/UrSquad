//
//  HeroImageProviderProtocol.swift
//  UrSquad
//
//  Created by Christos Tzimas on 17/4/23.
//

import Foundation
import SwiftUI

protocol HeroImageProviderProtocol {
    func getImage(from url: URL?, cropped: Bool) -> AnyView
}
