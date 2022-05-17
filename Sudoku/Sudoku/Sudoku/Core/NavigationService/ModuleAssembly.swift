//
//  ModuleAssembly.swift
//  Sudoku
//
//  Created by Aleksandr Fetisov on 16.05.2022.
//

import UIKit

protocol Assembly {
    
    func build(_ moduleName: ModuleName) -> UIViewController
}

class ModuleAssembly: Assembly {
    
    func build(_ moduleName: ModuleName) -> UIViewController {
        switch moduleName {
        case .menu: return MenuAssembly().build()
        }
    }
}
