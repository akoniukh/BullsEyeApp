//
//  LeaderboardView.swift
//  Bullseye
//
//  Created by Александр Конюх on 06.02.2022.
//

import SwiftUI

struct LeaderboardView: View {
    @Binding var leaderboardIsShowing: Bool
    @Binding var game: Game
    
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .edgesIgnoringSafeArea(.all)
            ScrollView {
                VStack(spacing: 10) {
                    HeaderView(leaderboardIsShowing: $leaderboardIsShowing)
                    LabelView()
                    VStack(spacing: 10) {
                        ForEach(game.leaderboardEnries.indices) { i in
                            let leaderboardEntry = game.leaderboardEnries[i]
                            RowView(index: i, score: leaderboardEntry.score, date: leaderboardEntry.date)
                        }
                    }
                }
            }
        }
    }
}

struct RowView: View {
    let index: Int
    let score: Int
    let date: Date
    
    var body: some View {
        HStack {
            RoundedTextView(text: String(index))
            Spacer()
            ScoreText(score: score)
                .frame(width: Constants.Leaderboard.ScoreColWidth)
            Spacer()
            DateText(date: date)
                .frame(width: Constants.Leaderboard.DateColWidth)
        }
        .background(
            RoundedRectangle(cornerRadius: .infinity)
                .strokeBorder(Color("LeaderboardRowColor"), lineWidth: Constants.General.strokeWidth)
        )
        .padding(.leading)
        .padding(.trailing)
        .frame(maxWidth: Constants.Leaderboard.MaxRowWidth)
    }
}

struct HeaderView: View {
    @Binding var leaderboardIsShowing: Bool
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    var body: some View {
        ZStack {
            HStack {
                if verticalSizeClass == .regular && horizontalSizeClass == .compact {
                    BigBoldText(text: "leaderboard")
                        .padding(.leading)
                    Spacer()
                } else {
                    BigBoldText(text: "leaderboard")
                }
            }
            .padding(.top)
            HStack {
                Spacer()
                Button(action: {
                    leaderboardIsShowing = false
                }) {
                RoundedImageViewFilled(systemName: "xmark")
                    .padding(.trailing)
                }
            }
        }
    }
}

struct LabelView: View {
    var body: some View {
        HStack {
            Spacer()
                .frame(width: Constants.General.roundedViewLength)
            Spacer()
            LabeTextView(text: "SCORE")
                .frame(width: Constants.Leaderboard.ScoreColWidth)
            Spacer()
            LabeTextView(text: "DATE")
                .frame(width: Constants.Leaderboard.DateColWidth)
        }
        .padding(.leading)
        .padding(.trailing)
        .frame(maxWidth: Constants.Leaderboard.MaxRowWidth)
    }
}


struct LeaderboardView_Previews: PreviewProvider {
    private static var leaderboardIsShowing = Binding.constant(false)
    private static var game = Binding.constant(Game(loadTestData: true))
    
    static var previews: some View {
        LeaderboardView(leaderboardIsShowing: leaderboardIsShowing, game: game)
        LeaderboardView(leaderboardIsShowing: leaderboardIsShowing, game: game)
            .previewLayout(.fixed(width: 568, height: 320))
        LeaderboardView(leaderboardIsShowing: leaderboardIsShowing, game: game)
            .preferredColorScheme(.dark)
        LeaderboardView(leaderboardIsShowing: leaderboardIsShowing, game: game)
            .previewLayout(.fixed(width: 568, height: 320))
            .preferredColorScheme(.dark)
    }
}
