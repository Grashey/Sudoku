//
//  InitialStateLoader.swift
//  Sudoku
//
//  Created by Aleksandr Fetisov on 04.12.2023.
//

import Foundation

class InitialStateLoader {
    
    func start(with mode: GameMode) -> [Position] {
        switch mode {
        case .easy:
            maxValues = 38
            maxValuesInRow = 8
        case .normal:
            maxValues = 30
            maxValuesInRow = 7
        }
        return makeInitialPositions()
    }
    
    private var state: [Position] = []
    private var maxValues: Int?
    private var maxValuesInRow: Int?
    private let maxBoardIndex = 8
    
    private func makeInitialPositions() -> [Position] {
        guard let maxValues = maxValues else { return [] }
        while state.count < maxValues {
            if let position = makePosition() {
                state.append(position)
            }
        }
        return state
    }
    
    private func makePosition() -> Position? {
        guard let maxValuesInRow = maxValuesInRow else { return nil }
        let row = Int.random(in: .zero...maxBoardIndex)
        let column = Int.random(in: .zero...maxBoardIndex)
        let position = Position(row: row, column: column)
    
        let valuesInRow = state.map({ $0.row == row }).filter({$0 == true}).count
        let valuesInColumn = state.map({ $0.column == column }).filter({$0 == true}).count
        
        if !state.contains(where: { position == $0 }) {
            if valuesInRow < maxValuesInRow, valuesInColumn < maxValuesInRow {
                return position
            }
        }
        return nil
    }
    
}
