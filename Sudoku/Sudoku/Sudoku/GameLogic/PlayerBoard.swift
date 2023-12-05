//
//  PlayerBoard.swift
//  Sudoku
//
//  Created by Aleksandr Fetisov on 04.12.2023.
//

import Foundation

struct PlayerBoard {
    let initialState: [Position]
    var trueOpened: [Position]
    var falseOpened: [FalseNumber]
}

extension PlayerBoard {
    
    func findStartPosition() -> Position {
        let indexes = [0, 1, 2, 3, 4, 5, 6, 7, 8]
        let openedPositions = initialState + trueOpened + falseOpened.map { $0.position }
        
        for row in indexes {
            for column in indexes {
                let position = Position(row: row, column: column)
                if !openedPositions.contains(position) {
                    return position
                }
            }
        }
        return Position(row: 0, column: 0)
    }
}
