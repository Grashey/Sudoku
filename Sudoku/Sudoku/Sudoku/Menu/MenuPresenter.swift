//
//  MenuPresenter.swift
//  Sudoku
//
//  Created by Aleksandr Fetisov on 16.05.2022.
//

import Foundation

protocol iMenuPresenter {
    
    func inProgress() -> Bool
}

class MenuPresenter {
    
    weak var viewController: MenuVC?
    let gameKeeper: Keeper
    var gameInProgress: Game?
    
    init(gameKeeper: Keeper = GameKeeper()) {
        self.gameKeeper = gameKeeper
        self.gameInProgress = gameKeeper.load()
    }

}

extension MenuPresenter: iMenuPresenter {
    
    func inProgress() -> Bool {
        gameInProgress != nil ? true : false
    }
}
