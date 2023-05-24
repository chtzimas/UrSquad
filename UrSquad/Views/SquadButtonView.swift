import SwiftUI

struct SquadButtonView: View {
    @Binding var hero: Hero
    @Binding var squadHeroes: [Hero]
    @Binding var showAlert: Bool

    var body: some View {
        Button {
            if hero.isInSquad {
                showAlert = true
            } else {
                recruitToSquad()
            }
        } label: {
            Text(
                hero.isInSquad
                    ? TextContent.squadButtonFireText
                    : TextContent.squadButtonRecruitText
            )
            .font(.headline)
            .fontWeight(.semibold)
        }
        .frame(height: .large)
        .frame(maxWidth: .infinity)
        .foregroundColor(.white)
        .background(hero.isInSquad ? .clear : .redLight)
        .cornerRadius(.small)
        .shadow(color: .redHighlight, radius: .medium)
        .overlay(
            RoundedRectangle(cornerRadius: .small)
                .stroke(
                    hero.isInSquad ? Color.redLight : .redDark,
                    style: StrokeStyle(lineWidth: .xSmall)
                )
        )
        .padding(.horizontal, .medium)
    }

    private func recruitToSquad() {
        hero.isInSquad = true
        squadHeroes.append(hero)
    }
}
