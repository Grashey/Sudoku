//
//  MenuView.swift
//  Sudoku
//
//  Created by Aleksandr Fetisov on 17.05.2022.
//

import UIKit

class MenuView: UIView {
    
    private let buttonHeight: CGFloat = 50
    private let inset: CGFloat = 30

    lazy var newGameButton: UIButton = {
        $0.setTitle(Constants.ButtonTitles.newGame, for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = .systemBlue
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.layer.cornerRadius = buttonHeight/2
        return $0
    }(UIButton())
    
    lazy var resumeGameButton: UIButton = {
        $0.setTitle(Constants.ButtonTitles.resumeGame, for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = .systemBlue
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.layer.cornerRadius = buttonHeight/2
        return $0
    }(UIButton())
    
    lazy var buttonStackView: UIStackView = {
        $0.axis = .vertical
        $0.distribution = .fillEqually
        $0.spacing = inset
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIStackView())
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        addSubviews()
        addConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func addSubviews() {
        self.addSubview(buttonStackView)
        buttonStackView.addArrangedSubview(newGameButton)
        buttonStackView.addArrangedSubview(resumeGameButton)
    }

    private func addConstraints() {
        NSLayoutConstraint.activate([
            buttonStackView.topAnchor.constraint(equalTo: self.centerYAnchor),
            buttonStackView.heightAnchor.constraint(equalToConstant: 2*buttonHeight + inset),
            buttonStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: self.bounds.width/4),
            buttonStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -self.bounds.width/4)
        ])
    }
    
    func configure(gameInProgress: Bool) {
        if gameInProgress {
            resumeGameButton.isEnabled = true
            resumeGameButton.backgroundColor = .systemBlue
        } else {
            resumeGameButton.isEnabled = false
            resumeGameButton.backgroundColor = .systemGray
        }
    }
    
}
