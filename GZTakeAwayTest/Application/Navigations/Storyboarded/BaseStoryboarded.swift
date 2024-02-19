//
//  BaseStoryBoarded.swift
//  GZTakeAwayTest
//
//  Created by Moh. Absar Rahman on 19/2/24.
//

enum StoryboardNames: String {
    // Storyboard names
    case main = "Main"
}

/// Base storyboard for handling storyboards
protocol BaseStoryboarded {

    static func instantiate() -> Self
}

