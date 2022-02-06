//
//  Game.swift
//  Bullseye
//
//  Created by Александр Конюх on 01.02.2022.
//

import Foundation

struct LeaderboardEntry {
    let score: Int
    let date: Date
}

struct Game {
    var target = Int.random(in: 1...100)
    var score = 0
    var round = 1
    var leaderboardEnries: [LeaderboardEntry] = []
    
    init(loadTestData: Bool = false) {
        if loadTestData {
            self.leaderboardEnries.append(LeaderboardEntry(score: 100, date: Date()))
            self.leaderboardEnries.append(LeaderboardEntry(score: 80, date: Date()))
            self.leaderboardEnries.append(LeaderboardEntry(score: 200, date: Date()))
            self.leaderboardEnries.append(LeaderboardEntry(score: 50, date: Date()))
            self.leaderboardEnries.append(LeaderboardEntry(score: 20, date: Date()))
        }
    }
    
    func points(sliderValue: Int) -> Int {
        let distance = abs(target - sliderValue)
        let bonus: Int
        if distance == 0 {
            bonus = 100
        } else if distance <= 2 {
            bonus = 50
        } else {
            bonus = 0
        }
        
        return 100 - abs(target - sliderValue) + bonus
    }
    
    mutating func addToLeaderboard(points: Int) {
        self.leaderboardEnries.append(LeaderboardEntry(score: points, date: Date()))
        self.leaderboardEnries.sort(by: { $0.score > $1.score})
    }
    
    mutating func startNewRound(points: Int) {
        self.round += 1
        self.score += points
        self.target = Int.random(in: 1...100)
        addToLeaderboard(points: points)
    }
    
    mutating func restart() {
        self.round = 1
        self.score = 0
        self.target = Int.random(in: 1...100)
    }
}
