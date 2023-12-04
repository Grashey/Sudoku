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
