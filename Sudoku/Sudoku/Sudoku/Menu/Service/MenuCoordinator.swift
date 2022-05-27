//
//  MenuCoordinator.swift
//  Sudoku
//
//  Created by Aleksandr Fetisov on 16.05.2022.
//

import UIKit

class MenuCoordinator {
    
    let assembly = ModuleAssembly.shared
    var window: UIWindow?
    var navigationController: UINavigationController?
    
    init(window: UIWindow?) {
        self.window = window
    }
}

extension MenuCoordinator: Coordinator {
    
    func start() {
        guard let controller = assembly.build(.menu) as? MenuViewController else { return }
        
        controller.onNewGame = { [weak self] in
            let session = SessionCoordinator(self?.navigationController)
            session.start()
        }
        
        controller.onResumeLastGame = {}
        
        navigationController = UINavigationController(rootViewController: controller)
        window?.rootViewController = navigationController
    }
}
