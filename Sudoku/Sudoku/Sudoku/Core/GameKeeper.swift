//
//  GameKeeper.swift
//  Sudoku
//
//  Created by Aleksandr Fetisov on 17.05.2022.
//

import Foundation

protocol Keeper {
    
    func save()
    func load() -> Game?
}

class GameKeeper: Keeper {
    
    func save() {
        print("save")
    }
    
    func load() -> Game? {
        print("load")
        return nil
    }
}
