//
//  RoundViews.swift
//  Bullseye
//
//  Created by Александр Конюх on 02.02.2022.
//

import SwiftUI


struct RoundedImageViewFilled: View {
    var systemName: String
    var body: some View {
        Image(systemName: systemName)
            .font(.title)
            .foregroundColor(Color("ButtonFilledTextColor"))
            .frame(width: Constants.General.roundedViewLength, height: Constants.General.roundedViewLength)
            .background(
            Circle()
                .fill(Color("ButtonFilledBackgroundColor")))
    }
}

struct RoundedImageViewStroked: View {
    var systemName: String
    var body: some View {
        Image(systemName: systemName)
            .font(.title)
            .foregroundColor(Color("TextViewColor"))
            .frame(width: Constants.General.roundedViewLength, height: Constants.General.roundedViewLength)
            .overlay(
                Circle()
                    .strokeBorder(Color("ButtonStrokeColor"), lineWidth: Constants.General.strokeWidth))
    }
}

struct RoundRectTextView: View {
    var text: String
    var body: some View {
        Text(text)
            .bold()
            .font(.title3)
            .kerning(-0.2)
            .foregroundColor(Color("TextViewColor"))
            .frame(width: Constants.General.roundedRectWidth, height: Constants.General.roundedRectHeight)
            .overlay(
                RoundedRectangle(cornerRadius: Constants.General.roundedRectCornerRadius)
                    .strokeBorder(Color("ButtonStrokeColor"), lineWidth: Constants.General.strokeWidth))
    }
}

struct RoundedTextView: View {
    let text: String
    
    var body: some View {
        Text(text)
            .bold()
            .font(.title3)
            .foregroundColor(Color("TextViewColor"))
            .frame(width: Constants.General.roundedViewLength, height: Constants.General.roundedViewLength)
            .overlay(
                Circle()
                    .strokeBorder(Color("LeaderboardRowColor"), lineWidth: Constants.General.strokeWidth))
        
        
    }
}

struct PreviewView: View {
    var body: some View {
        VStack (spacing: 10) {
        RoundedImageViewStroked(systemName: "arrow.counterclockwise")
            RoundedImageViewFilled(systemName: "list.dash")
            RoundRectTextView(text: "999")
            RoundedTextView(text: "1")
        }
    }
}

struct RoundViews_Previews: PreviewProvider {
    static var previews: some View {
        PreviewView()
        PreviewView()
            .preferredColorScheme(.dark)
    }
}
