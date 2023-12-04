//
//  BoardGenerator.swift
//  Sudoku
//
//  Created by Aleksandr Fetisov on 16.05.2022.
//

import Foundation

typealias Board = [[Int]]

protocol GameGenerator {
    func generate() -> Board
}

///  Note: Создается массив из 9 массивов reference, случайным образом перемешивается. (идея взята тут: https://habr.com/ru/post/192102 )
final class BoardGenerator {
    
    private let reference: Array = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    private var masterArray = Array(repeating: Array(repeating: Int(), count: 9), count: 9)
    
    ///  каждый следующий массив в masterArray смещает свои элементы на 3 влево по кругу
    private func makeSimpleBoard() {
        var newReference = reference.shuffled()
        for index in .zero..<masterArray.count {
            masterArray[index] = newReference
            if index == 2 || index == 5 {
                let temp = Array(newReference.dropLast(5))
                newReference.removeFirst(4)
                newReference += temp
            } else {
                let temp = Array(newReference.dropLast(6))
                newReference.removeFirst(3)
                newReference += temp
            }
        }
    }
    
    /// столбцы становятся строками и наоборот
    private func transposing() {
        var newArray = Array(repeating: Array(repeating: Int(), count: 9), count: 9)
        for index in .zero..<masterArray.count {
            newArray[index] = masterArray.compactMap { $0[index] }
        }
        masterArray = newArray
    }
    
    /// обмен двух строк внутри одного района
    private func swapRows() {
        let firstIndex = Int.random(in: .zero..<masterArray.count)
        let secondIndex = makeIndexForSwapSmall(firstIndex)
        let tempRow = masterArray[firstIndex]
        masterArray[firstIndex] = masterArray[secondIndex]
        masterArray[secondIndex] = tempRow
    }
    
    /// обмен двух столбцов внутри одного района
    private func swapColumns() {
        transposing()
        swapRows()
        transposing()
    }
    
    /// обмен двух районов по горизонтали
    private func swapAreaRows() {
        let firstIndex = Int.random(in: .zero..<masterArray.count/3)
        let secondIndex = makeIndexForSwapArea(firstIndex)
        let firstAreaIndexes = makeIndexesForArea(firstIndex)
        let secondAreaIndexes = makeIndexesForArea(secondIndex)
        let tempArray = firstAreaIndexes.map { masterArray[$0] }
        for (firstIndex, secondIndex) in zip(firstAreaIndexes, secondAreaIndexes) {
            masterArray[firstIndex] = masterArray[secondIndex]
        }
        for index in .zero..<tempArray.count {
           masterArray[secondAreaIndexes[index]] = tempArray[index]
        }
    }
    
    /// обмен двух районов по вертикали
    private func swapAreaColumns() {
        transposing()
        swapAreaRows()
        transposing()
    }
    
    private func makeIndexForSwapSmall(_ firstIndex: Int) -> Int {
        var indexArray = [Int]()
        if firstIndex <= 2 {
            indexArray = [0, 1, 2]
        } else if firstIndex > 2 && firstIndex <= 5 {
            indexArray = [3, 4, 5]
        } else if firstIndex > 5 {
            indexArray = [6, 7, 8]
        }
        indexArray = indexArray.filter { $0 != firstIndex }
        let index = Int.random(in: .zero..<indexArray.count)
        return indexArray[index]
    }
    
    private func makeIndexForSwapArea(_ firstIndex: Int) -> Int {
        let indexArray = [0, 1, 2].filter { $0 != firstIndex }
        let index = Int.random(in: .zero..<indexArray.count)
        return indexArray[index]
    }
    
    private func makeIndexesForArea(_ areaIndex: Int) -> [Int] {
        var indexes = [Int]()
        if areaIndex == 0 {
            indexes = [0, 1, 2]
        } else if areaIndex == 1 {
            indexes = [3, 4, 5]
        } else if areaIndex == 2 {
            indexes = [6, 7, 8]
        }
        return indexes
    }
}

extension BoardGenerator: GameGenerator {
    
    func generate() -> Board {
        makeSimpleBoard()
        let operations: [Void] = [transposing(), swapRows(), swapColumns(), swapAreaRows(), swapAreaColumns()]
        let queque = DispatchQueue(label: "serial")
        for _ in 0...100000 {
            queque.sync {
                let operationIndex = Int.random(in: 0..<operations.count)
                operations[operationIndex]
            }
        }
        return masterArray
    }
}
