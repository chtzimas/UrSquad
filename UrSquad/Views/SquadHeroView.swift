import Factory
import Kingfisher
import SwiftUI

struct SquadHeroView: View {
    @Injected(\.heroImageProvider) private var imageProvider
    var thumbnailPath: String
    var name: String

    var body: some View {
        VStack {
            imageProvider.getImage(
                from: URL(string: thumbnailPath),
                cropped: true
            )
            VStack {
                Text(name)
                    .font(.footnote)
                    .fontWeight(.bold)
                    .lineLimit(2)
                    .foregroundColor(.white)
                Spacer()
            }
            .frame(height: .large)
        }
        .frame(maxWidth: .xLarge)
    }
}
