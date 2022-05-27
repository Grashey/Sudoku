//
//  MenuViewController.swift
//  Sudoku
//
//  Created by Aleksandr Fetisov on 16.05.2022.
//

import UIKit

protocol MenuVC: AnyObject {}

class MenuViewController: UIViewController {
    
    var presenter: iMenuPresenter?

    var onNewGame: (() -> Void)?
    var onResumeLastGame: (() -> Void)?
    
    lazy var menuView = MenuView(frame: view.frame)

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addSubview(menuView)
        menuView.newGameButton.addTarget(self, action: #selector(newGame), for: .touchUpInside)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let inProgress = presenter?.inProgress() else { return }
        menuView.configure(gameInProgress: inProgress)
    }
    
    @objc func newGame() {
        onNewGame?()
    }
    
}

extension MenuViewController: MenuVC {}
