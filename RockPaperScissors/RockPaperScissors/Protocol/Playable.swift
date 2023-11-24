//
//  Playable.swift
//  RockPaperScissors
//
//  Created by EUNJU on 2023/11/24.
//

import Foundation

protocol Playable {
    
    func validateUserInput(_ input: String?) throws -> RockPaperScissorsType
    func judgeGame(user: RockPaperScissorsType, computer: RockPaperScissorsType?) -> UserGuideMessage
    func showMessage()
}