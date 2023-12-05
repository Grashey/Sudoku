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
    var position: Position
    
    init(gameBoard: Board, playerBoard: PlayerBoard, startPosition: Position, gameMode: GameMode) {
        self.gameBoard = gameBoard
        self.playerBoard = playerBoard
        self.gameMode = gameMode
        self.position = startPosition
    }
    
}
