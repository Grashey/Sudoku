//
//  MenuViewController.swift
//  Sudoku
//
//  Created by Aleksandr Fetisov on 16.05.2022.
//

import UIKit

protocol MenuVC: AnyObject {}

class MenuViewController: UIViewController {
    
    var presenter: MenuPresenterProtocol?

    var onNewGame: (() -> Void)?
    var onResumeLastGame: (() -> Void)?
    
    lazy var menuView = MenuView(frame: view.frame)

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addSubview(menuView)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let inProgress = presenter?.inProgress() else { return }
        menuView.configure(gameInProgress: inProgress)
    }
    
}

extension MenuViewController: MenuVC {}
