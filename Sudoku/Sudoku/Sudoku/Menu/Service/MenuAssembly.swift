//
//  MenuAssembly.swift
//  Sudoku
//
//  Created by Aleksandr Fetisov on 16.05.2022.
//

import UIKit

class MenuAssembly {
    
    func build() -> UIViewController {
        let controller = MenuViewController()
        let presenter = MenuPresenter()
        controller.presenter = presenter
        presenter.viewController = controller
        return controller
    }
}
