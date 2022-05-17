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

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .yellow
    }
    

}

extension MenuViewController: MenuVC {}
