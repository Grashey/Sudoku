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
    
    func standOn(position: Position) {
        self.position = position
    }
    
    func apply(value: Int) {
        guard !playerBoard.checkIsInitial(position: position) else { return }
        let gameValue = gameBoard[position.row][position.column]
        
        if value == gameValue {
            let cellIsOpened = playerBoard.contains(position: position)
            if !cellIsOpened {
                playerBoard.save(position: position)
            } else {
                let cellIsFalseOpened = playerBoard.contains(falseValue: value, position: position)
                if !cellIsFalseOpened {
                    playerBoard.remove(position: position)
                }
            }
            if playerBoard.contains(falseValue: value, position: position) {
                playerBoard.remove(falseValue: value, position: position)
            }
        } else {
            let cellIsOpened = playerBoard.contains(position: position)
            if !cellIsOpened {
                playerBoard.save(position: position)
            } else {
                playerBoard.remove(position: position)
            }
        }
       
    }
    
}
