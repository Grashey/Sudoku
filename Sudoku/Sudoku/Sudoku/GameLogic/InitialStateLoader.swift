//
//  InitialStateLoader.swift
//  Sudoku
//
//  Created by Aleksandr Fetisov on 04.12.2023.
//

import Foundation

class InitialStateLoader {
    
    private var state: [Position] = []
    private var startOpenedValues: Int?
    private var maxValuesInRow: Int?
    private let maxBoardIndex = 8
    private var areas: [[Position]]?
    
    func start(with mode: GameMode) -> [Position] {
        areas = makeAreas()
        
        switch mode {
        case .easy:
            startOpenedValues = 38
            maxValuesInRow = 8
        case .normal:
            startOpenedValues = 30
            maxValuesInRow = 7
        }
        
        return makeInitialPositions()
    }
    
    private func makeInitialPositions() -> [Position] {
        guard let startOpenedValues = startOpenedValues else { return [] }
        while state.count < startOpenedValues {
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
        
        guard let areas = areas, let area = areas.first(where: { $0.contains(where: { $0 == position })}) else { return nil }
        var valuesinArea: Int = .zero
        for position in area {
            if state.contains(where: { $0 == position }) {
                valuesinArea += 1
            }
        }
        
        if !state.contains(where: { position == $0 }) {
            if valuesInRow < maxValuesInRow, valuesInColumn < maxValuesInRow, valuesinArea < maxValuesInRow {
                return position
            }
        }
        return nil
    }
    
    private func makeAreas() -> [[Position]] {
        var areas: [[Position]] = []
        let firstIndexes = [0,1,2]
        let secondIndexes = [3,4,5]
        let thirdIndexes = [6,7,8]
        let indexes = [firstIndexes, secondIndexes, thirdIndexes]
        
        for areaInRow in indexes {
            for areaInColumn in indexes {
                var areaPositions: [Position] = []
                for row in areaInRow {
                    for column in areaInColumn {
                        let position = Position(row: row, column: column)
                        areaPositions.append(position)
                    }
                }
                areas.append(areaPositions)
            }
        }
        return areas
    }
    
}
