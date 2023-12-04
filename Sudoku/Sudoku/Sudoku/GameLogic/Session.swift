//
//  Session.swift
//  Sudoku
//
//  Created by Aleksandr Fetisov on 04.12.2023.
//

import Foundation

class Session {
    
    let gameBoard: Board
    var playerBoard: PlayerBoard
    let gameMode: GameMode
    
    init(gameBoard: Board, playerBoard: PlayerBoard, gameMode: GameMode) {
        self.gameBoard = gameBoard
        self.playerBoard = playerBoard
        self.gameMode = gameMode
    }
    
}
