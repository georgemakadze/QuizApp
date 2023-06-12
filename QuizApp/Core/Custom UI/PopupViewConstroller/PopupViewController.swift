//
//  PopupViewController.swift
//  QuizApp
//
//  Created by Giorgi Makadze on 08.06.2023.
//

import Foundation
import UIKit

class PopupViewController: UIViewController {
    
    //MARK: - Components
    
    private lazy var popupView: UIView = {
        let popupView = UIView()
        popupView.backgroundColor = Constants.PopupView.backgroundColor
        popupView.layer.cornerRadius = Constants.PopupView.cornerRadius
        popupView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(popupView)
        return popupView
    }()
    
    private lazy var popupLabel: UILabel = {
        let popupLabel = UILabel()
        popupLabel.text = Constants.PopupLabel.text
        popupLabel.backgroundColor = Constants.PopupLabel.backgroundColor
        popupLabel.numberOfLines = Constants.PopupLabel.numberOfLines
        popupLabel.lineBreakMode = .byTruncatingTail
        popupLabel.font = .systemFont(ofSize: Constants.PopupLabel.font)
        popupLabel.textColor = Constants.PopupLabel.textColor
        popupLabel.translatesAutoresizingMaskIntoConstraints = false
        popupView.addSubview(popupLabel)
        return popupLabel
    }()
    
    private lazy var yesButton: UIButton = {
        let yesButton = UIButton()
        yesButton.backgroundColor = Constants.YesButton.backgroundColor
        yesButton.setTitle(Constants.YesButton.setTitle, for: .normal)
        yesButton.setTitleColor(Constants.YesButton.setTitleColor, for: .normal)
        yesButton.layer.cornerRadius = Constants.YesButton.cornerRadius
        yesButton.addTarget(self, action: #selector(yesButtonTapped), for: .touchUpInside)
        yesButton.translatesAutoresizingMaskIntoConstraints = false
        popupView.addSubview(yesButton)
        return yesButton
    }()
    
    private lazy var noButton: UIButton = {
        let noButton = UIButton()
        noButton.backgroundColor = Constants.NoButton.backgroundColor
        noButton.setTitle(Constants.NoButton.setTitle, for: .normal)
        noButton.setTitleColor(Constants.NoButton.setTitleColor, for: .normal)
        noButton.layer.cornerRadius = Constants.NoButton.cornerRadius
        noButton.addTarget(self, action: #selector(yesButtonTapped), for: .touchUpInside)
        noButton.translatesAutoresizingMaskIntoConstraints = false
        popupView.addSubview(noButton)
        return noButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Constants.View.backgroundColor
        setupPopupViewConstraints()
        setupPopupLabelConstraints()
        setupYesButtonConstraints()
        setupNoButtonConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    @objc func yesButtonTapped() {
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Constraints Setup
    
    private func setupPopupViewConstraints() {
        NSLayoutConstraint.activate([
            popupView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            popupView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            popupView.widthAnchor.constraint(equalToConstant: Constants.PopupView.widthAnchor),
            popupView.heightAnchor.constraint(equalToConstant: Constants.PopupView.heightAnchor)
        ])
    }
    
    private func setupPopupLabelConstraints() {
        NSLayoutConstraint.activate([
            popupLabel.topAnchor.constraint(equalTo: popupView.topAnchor, constant: Constants.PopupLabel.topAnchor),
            popupLabel.leadingAnchor.constraint(equalTo: popupView.leadingAnchor, constant: Constants.PopupLabel.leadingAnchor),
            popupLabel.trailingAnchor.constraint(equalTo: popupView.trailingAnchor, constant: Constants.PopupLabel.trailingAnchor)
        ])
    }
    
    private func setupYesButtonConstraints() {
        NSLayoutConstraint.activate([
            yesButton.widthAnchor.constraint(equalToConstant: Constants.YesButton.widthAnchor),
            yesButton.heightAnchor.constraint(equalToConstant: Constants.YesButton.heightAnchor),
            yesButton.topAnchor.constraint(equalTo: popupLabel.bottomAnchor, constant: Constants.YesButton.topAnchor),
            yesButton.leadingAnchor.constraint(equalTo: popupView.leadingAnchor, constant: Constants.YesButton.leadingAnchor)
        ])
    }
    
    private func setupNoButtonConstraints() {
        NSLayoutConstraint.activate([
            noButton.widthAnchor.constraint(equalToConstant: Constants.NoButton.widthAnchor),
            noButton.heightAnchor.constraint(equalToConstant: Constants.NoButton.heightAnchor),
            noButton.topAnchor.constraint(equalTo: popupLabel.bottomAnchor, constant: Constants.NoButton.topAnchor),
            noButton.trailingAnchor.constraint(equalTo: popupView.trailingAnchor, constant: Constants.NoButton.trailingAnchor)
        ])
    }
}

//MARK: - Constants

private extension PopupViewController {
    enum Constants {
        
        enum PopupView {
            static let backgroundColor = UIColor(hex: "FFC44A")
            static let cornerRadius: CGFloat = 10
            static let widthAnchor: CGFloat = 270
            static let heightAnchor: CGFloat = 176
        }
        
        enum PopupLabel {
            static let text = "ნამდვილად გსრურთ გასვლა?"
            static let backgroundColor: UIColor = .clear
            static let textColor: UIColor = .white
            static let font: CGFloat = 18
            static let numberOfLines = 3
            static let topAnchor: CGFloat = 38
            static let leadingAnchor: CGFloat = 24
            static let trailingAnchor: CGFloat = -24
        }
        
        enum YesButton {
            static let backgroundColor: UIColor = .white
            static let setTitleColor: UIColor = .black
            static let setTitle = "კი"
            static let cornerRadius: CGFloat = 17
            static let widthAnchor: CGFloat = 106
            static let heightAnchor: CGFloat = 34
            static let topAnchor: CGFloat = 42
            static let leadingAnchor: CGFloat = 24
        }
        
        enum NoButton {
            static let backgroundColor: UIColor = .white
            static let setTitleColor: UIColor = .black
            static let setTitle = "არა"
            static let cornerRadius: CGFloat = 17
            static let widthAnchor: CGFloat = 106
            static let heightAnchor: CGFloat = 34
            static let topAnchor: CGFloat = 42
            static let trailingAnchor: CGFloat = -24
        }
        
        enum View {
            static let backgroundColor: UIColor = UIColor(white: 0, alpha: 0.5)
        }
    }
}
