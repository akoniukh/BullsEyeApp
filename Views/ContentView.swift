//
//  ContentView.swift
//  Bullseye
//
//  Created by Александр Конюх on 30.01.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var alertIsVisible = false
    @State private var sliderValue = 50.0
    @State private var game = Game()
    
    
    var body: some View {
        ZStack {
            BackgroundView(game: $game)
            VStack {
                InstructionsView(game: $game)
                    .padding(.bottom, alertIsVisible ? 0 : 100)
                if alertIsVisible {
                    PointsView(alertIsVisible: $alertIsVisible, sliderValue: $sliderValue, game: $game, title: "THE SLIDER'S VALUE IS")
                        .transition(.scale)
                } else {
                    HitMeButtonView(alertIsVisible: $alertIsVisible, sliderValue: $sliderValue, game: $game, text: "HIT ME")
                        .transition(.scale)
                }
            }
            if !alertIsVisible {
                SliderView(sliderValue: $sliderValue, leftNumber: 1.0, rightNumber: 100.0)
                    .transition(.scale)
            }
        }
    }
}

struct SliderView: View {
    
    @Binding var sliderValue: Double
    
    var leftNumber: Double
    var rightNumber: Double
    var body: some View {
        HStack {
            Text(String(Int(leftNumber)))
                .bold()
                .font(.title3)
                .foregroundColor(Color("TextViewColor"))
                .frame(width: 35.0)
            Slider(value: $sliderValue, in: leftNumber...rightNumber)
            Text(String(Int(rightNumber)))
                .bold()
                .font(.title3)
                .foregroundColor(Color("TextViewColor"))
                .frame(width: 35.0)
        }
        .padding()
    }
}

struct InstructionsView : View {
    
    @Binding var game : Game
    
    var body : some View {
        VStack {
            InstructionText(text: "😎\nPUT THE BULLSEYE AS CLOSE AS YOU CAN!")
                .padding(.leading, 30.0)
                .padding(.trailing, 30.0)
            TargetNumberText(text: String(game.target))
        }
    }
}

struct HitMeButtonView: View {
    
    @Binding var alertIsVisible: Bool
    @Binding var sliderValue: Double
    @Binding var game: Game
    
    var text: String
    var body: some View {
        Button(action: {
            withAnimation() {
                alertIsVisible = true
            }
        }) {
            Text("HIT ME")
                .bold()
        }
        .padding(20.0)
        .background(
            ZStack {
                Color("ButtonColor")
                LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.3), Color.clear]), startPoint: .top, endPoint: .bottom)
            }
        )
        .foregroundColor(Color.white)
        .cornerRadius(Constants.General.roundedRectCornerRadius)
        .overlay(RoundedRectangle(cornerRadius: Constants.General.roundedRectCornerRadius)
                    .strokeBorder(Color.white, lineWidth: Constants.General.strokeWidth))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ContentView()
            .previewLayout(.fixed(width: 568, height: 320))
        ContentView()
            .preferredColorScheme(.dark)
        ContentView()
            .previewLayout(.fixed(width: 568, height: 320))
            .preferredColorScheme(.dark)
    }
}
