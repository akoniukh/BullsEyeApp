//
//  TextViews.swift
//  Bullseye
//
//  Created by Александр Конюх on 02.02.2022.
//

import SwiftUI

struct InstructionText: View {
    var text : String
    var body: some View {
        Text(text.uppercased())
            .bold()
            .kerning(2.0)
            .multilineTextAlignment(.center)
            .lineSpacing(4.0)
            .font(.footnote)
            .foregroundColor(Color("TextViewColor"))

    }
}

struct TargetNumberText: View {
    var text: String
    var body: some View {
        Text(text)
            .fontWeight(.black)
            .kerning(-1.0)
            .font(.largeTitle)
            .foregroundColor(Color("TextViewColor"))
    }
}

struct LabeTextView: View {
    var text: String
    var body: some View {
        Text(text)
            .bold()
            .foregroundColor(Color("TextViewColor"))
            .kerning(1.5)
            .font(.caption)
    }
}

struct BodyTextView: View {
    var text: String
    var body: some View {
        Text(text)
            .font(.subheadline)
            .fontWeight(.semibold)
            .multilineTextAlignment(.center)
            .lineSpacing(12.0)
    }
}

struct ButtonTextView: View {
    var text: String
    var body: some View {
        Text(text)
            .bold()
            .padding()
            .frame(maxWidth: .infinity)
            .background(
                Color.accentColor
            )
            .foregroundColor(Color.white)
            .cornerRadius(12)
        
    }
}

struct ScoreText: View {
    var score: Int
    var body: some View {
        Text(String(score))
            .bold()
            .kerning(-0.2)
            .font(.title3)
            .foregroundColor(Color("TextViewColor"))
    }
}

struct DateText: View {
    var date: Date
    var body: some View {
        Text(date, style: .time)
            .bold()
            .kerning(-0.2)
            .font(.title3)
            .foregroundColor(Color("TextViewColor"))
    }
}

struct BigBoldText: View {
    var text: String
    
    var body: some View {
        Text(text.uppercased())
            .kerning(2.0)
            .foregroundColor(Color("TextViewColor"))
            .font(.title)
            .fontWeight(.black)
        
    }
}

struct TextViews_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            InstructionText(text: "Instructions")
            TargetNumberText(text: "999")
            LabeTextView(text: "9")
            BodyTextView(text: "You scored 200 points\n🏂🏂🏂")
            ButtonTextView(text: "New Round!")
            ScoreText(score: 123)
            DateText(date: Date())
            BigBoldText(text: "leaderboard")
        }
        .padding()
    }
}
