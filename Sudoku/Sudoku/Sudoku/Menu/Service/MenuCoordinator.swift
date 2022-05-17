//
//  MenuCoordinator.swift
//  Sudoku
//
//  Created by Aleksandr Fetisov on 16.05.2022.
//

import UIKit

class MenuCoordinator {
    
    let assembly: Assembly
    var window: UIWindow?
    var navigationController: UINavigationController?
    
    init(assembly: Assembly = ModuleAssembly(), window: UIWindow?) {
        self.window = window
        self.assembly = assembly
    }
}

extension MenuCoordinator: Coordinator {
    
    func start() {
        guard let controller = assembly.build(.menu) as? MenuViewController else { return }
        
        controller.onNewGame = {}
        controller.onResumeLastGame = {}
        
        navigationController = UINavigationController(rootViewController: controller)
        window?.rootViewController = navigationController
    }
}
