//
//  SessionPresenter.swift
//  Sudoku
//
//  Created by Aleksandr Fetisov on 27.05.2022.
//

import Foundation

protocol iSessionPresenter {}

class SessionPresenter {
    
    weak var viewController: SessionViewController?
}

extension SessionPresenter: iSessionPresenter {}
