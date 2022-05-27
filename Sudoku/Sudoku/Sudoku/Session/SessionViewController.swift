//
//  SessionViewController.swift
//  Sudoku
//
//  Created by Aleksandr Fetisov on 27.05.2022.
//

import UIKit

class SessionViewController: UIViewController {
    
    var presenter: iSessionPresenter?
    var onFinishFlow: (() -> Void)?
    lazy var sessionView = SessionView(frame: view.frame)

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(sessionView)
    }

}
