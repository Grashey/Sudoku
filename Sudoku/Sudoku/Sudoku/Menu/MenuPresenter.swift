//
//  MenuPresenter.swift
//  Sudoku
//
//  Created by Aleksandr Fetisov on 16.05.2022.
//

import Foundation

protocol MenuPresenterProtocol {}

class MenuPresenter {
    
    weak var viewController: MenuVC?
    
}

extension MenuPresenter: MenuPresenterProtocol {}
