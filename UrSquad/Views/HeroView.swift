import Factory
import Kingfisher
import SwiftUI

struct HeroView: View {
    @Injected(\.heroImageProvider) private var imageProvider
    var thumbnailPath: String
    var name: String

    var body: some View {
        HStack {
            imageProvider.getImage(
                from: URL(string: thumbnailPath),
                cropped: true
            )
            Text(name)
                .foregroundColor(.white)
                .font(.headline)
                .fontWeight(.bold)
                .lineLimit(1)
            Spacer()
            Image.chevronImage
                .padding(.horizontal, .medium)
                .foregroundColor(Color.greyLight)
        }
        .background(Color.greyMedium)
        .cornerRadius(.small)
        .padding(.horizontal, .medium)
    }
}
