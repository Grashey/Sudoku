//
//  ViewController.swift
//  Sudoku
//
//  Created by Aleksandr Fetisov on 16.05.2022.
//

import UIKit

class ViewController: UIViewController {
    
    let generator = BoardGenerator()
    let starter = InitialStateLoader()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let board = generator.generate()
        let mode: GameMode = .easy
        let initialState = starter.start(with: mode)
//        let playerBoard = PlayerBoard(initialState: initialState, trueOpened: [], falseOpened: [])
//        let session = Session(gameBoard: board, playerBoard: playerBoard, gameMode: mode)
        
        
        // тестовый вывод результата в консоль
        for row in 0..<9 {
            var string: String = ""
            for column in 0..<9 {
                if initialState.contains(where: { $0 == Position(row: row, column: column) }) {
                    string += "\(board[row][column]) "
                } else {
                    string += "_ "
                }
            }
            print(string)
        }
        
        print("")
        
        for row in board {
            print(row.description)
        }
    }

}

