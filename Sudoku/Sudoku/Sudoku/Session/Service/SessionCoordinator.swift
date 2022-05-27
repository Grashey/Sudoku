//
//  SessionCoordinator.swift
//  Sudoku
//
//  Created by Aleksandr Fetisov on 27.05.2022.
//

import UIKit

class SessionCoordinator {
    
    let assembly = ModuleAssembly.shared
    var navigationController: UINavigationController?
    
    init(_ navigation: UINavigationController?) {
        self.navigationController = navigation
    }
}

extension SessionCoordinator: Coordinator {
    
    func start() {
        guard let controller = assembly.build(.session) as? SessionViewController else { return }
        navigationController?.pushViewController(controller, animated: true)
        
        controller.onFinishFlow = { [weak self] in self?.navigationController?.popViewController(animated: true) }
    }
}
