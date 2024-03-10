//
//  PlayerBoard.swift
//  Sudoku
//
//  Created by Aleksandr Fetisov on 04.12.2023.
//

import Foundation

struct PlayerBoard {
    let initialState: [Position]
    var openedPositions: [Position]
    var falseOpened: [FalseNumber]
}

extension PlayerBoard {
    
    func findStartPosition() -> Position {
        let indexes = [0, 1, 2, 3, 4, 5, 6, 7, 8]
        let openedPositions = initialState + openedPositions
        
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
    
    mutating func save(position: Position) {
        if !openedPositions.contains(position) {
            openedPositions.append(position)
        }
    }
    
    mutating func remove(position: Position) {
        if let index = openedPositions.firstIndex(of: position) {
            openedPositions.remove(at: index)
        }
    }
    
    func contains(position: Position) -> Bool {
        openedPositions.contains(position)
    }
    
    mutating func save(falseValue: Int, position: Position) {
        let falseNumber = FalseNumber(value: falseValue, position: position)
        if !falseOpened.map({$0.position}).contains(position) {
            falseOpened.append(falseNumber)
        }
    }
    
    mutating func remove(falseValue: Int, position: Position) {
        if let index = falseOpened.firstIndex(where: { $0.position == position }) {
            falseOpened.remove(at: index)
        }
    }
    
    func contains(falseValue: Int, position: Position) -> Bool {
        falseOpened.map({$0.position}).contains(position)
    }
    
    func checkIsInitial(position: Position) -> Bool {
        initialState.contains(position)
    }
    
}
