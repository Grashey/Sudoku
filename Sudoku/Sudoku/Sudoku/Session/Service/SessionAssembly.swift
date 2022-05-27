//
//  SessionAssembly.swift
//  Sudoku
//
//  Created by Aleksandr Fetisov on 27.05.2022.
//

import UIKit

class SessionAssembly: Assembly {
    
    func build() -> UIViewController {
        let controller = SessionViewController()
        let presenter = SessionPresenter()
        controller.presenter = presenter
        presenter.viewController = controller
        return controller
    }
}
