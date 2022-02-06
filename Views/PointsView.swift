//
//  PointsView.swift
//  Bullseye
//
//  Created by Александр Конюх on 04.02.2022.
//

import SwiftUI

struct PointsView: View {
    @Binding var alertIsVisible: Bool
    @Binding var sliderValue: Double
    @Binding var game: Game
    
    var title : String
    
    var body: some View {
        let roundedValue = Int(round(sliderValue))
        let points = game.points(sliderValue: roundedValue)
        VStack(spacing: 15.0) {
            InstructionText(text: title)
            TargetNumberText(text: String(roundedValue))
            BodyTextView(text: "You scored \(points) points\n🏂🏂🏂")
            Button(action: {
                withAnimation() {
                    alertIsVisible = false
                }
                game.startNewRound(points: points)
            }) {
                ButtonTextView(text: "New Round!")
            }
        }
        .padding()
        .frame(maxWidth: 300)
        .background(Color("BackgroundColor"))
        .cornerRadius(Constants.General.roundedRectCornerRadius)
        .shadow(radius: 10, x: 5, y: 5)
        .transition(.scale)
    }
}

struct PointsView_Previews: PreviewProvider {
    static private var alertIsVisible = Binding.constant(false)
    static private var sliderValue = Binding.constant(50.0)
    static private var game = Binding.constant(Game())
    
    
    static var previews: some View {
        PointsView(alertIsVisible: alertIsVisible, sliderValue: sliderValue, game: game, title: "THE SLIDER'S VALUE IS")
        PointsView(alertIsVisible: alertIsVisible, sliderValue: sliderValue, game: game, title: "THE SLIDER'S VALUE IS")
            .previewLayout(.fixed(width: 568, height: 320))
        PointsView(alertIsVisible: alertIsVisible, sliderValue: sliderValue, game: game, title: "THE SLIDER'S VALUE IS")
            .preferredColorScheme(.dark)
        PointsView(alertIsVisible: alertIsVisible, sliderValue: sliderValue, game: game, title: "THE SLIDER'S VALUE IS")
            .previewLayout(.fixed(width: 568, height: 320))
            .preferredColorScheme(.dark)
    }
}
