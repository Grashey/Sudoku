//
//  SessionView.swift
//  Sudoku
//
//  Created by Aleksandr Fetisov on 27.05.2022.
//

import UIKit

class SessionView: UIView {

    lazy var infoBoardView: UIView = {
        $0.backgroundColor = .red
        return $0
    }(UIView())
    
    lazy var gameBoardView: UIView = {
        $0.backgroundColor = .green
        return $0
    }(UIView())
    
    lazy var abilityBoardView: UIView = {
        $0.backgroundColor = .blue
        return $0
    }(UIView())
    
    lazy var numbersBoardView: UIView = {
        $0.backgroundColor = .magenta
        return $0
    }(UIView())
    
    private lazy var contentStackView: UIStackView = {
        $0.axis = .vertical
        $0.distribution = .fillEqually
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIStackView())
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        addSubviews()
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        self.addSubview(contentStackView)
        contentStackView.addArrangedSubview(infoBoardView)
        contentStackView.addArrangedSubview(gameBoardView)
        contentStackView.addArrangedSubview(abilityBoardView)
        contentStackView.addArrangedSubview(numbersBoardView)
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            contentStackView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            contentStackView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            contentStackView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            contentStackView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
}
