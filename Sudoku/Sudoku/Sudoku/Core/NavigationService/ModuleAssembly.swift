//
//  ModuleAssembly.swift
//  Sudoku
//
//  Created by Aleksandr Fetisov on 16.05.2022.
//

import UIKit

protocol Assembly {
    
    func build() -> UIViewController
}

class ModuleAssembly {
    
    static let shared = ModuleAssembly()
    
    func build(_ moduleName: ModuleName) -> UIViewController {
        assembly(moduleName).build()
    }
    
    func assembly(_ moduleName: ModuleName) -> Assembly {
        switch moduleName {
        case .menu: return MenuAssembly()
        case .session: return SessionAssembly()
        }
    }
}
