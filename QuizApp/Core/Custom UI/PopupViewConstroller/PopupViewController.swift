//
//  PopupViewController.swift
//  QuizApp
//
//  Created by Giorgi Makadze on 08.06.2023.
//

import Foundation
import UIKit

class PopupViewController: UIViewController {
    
    private lazy var popupView: UIView = {
        let popupView = UIView()
        popupView.backgroundColor = UIColor(hex: "FFC44A")
        popupView.layer.cornerRadius = 10
        popupView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(popupView)
        return popupView
    }()
    
    private lazy var popupLabel: UILabel = {
        let popupLabel = UILabel()
        popupLabel.text = "ნამდვილად გსრურთ გასვლა?"
        popupLabel.backgroundColor = .clear
        popupLabel.numberOfLines = 3
        popupLabel.lineBreakMode = .byTruncatingTail
        popupLabel.font = .systemFont(ofSize: 18)
        popupLabel.textColor = .white
        popupLabel.translatesAutoresizingMaskIntoConstraints = false
        popupView.addSubview(popupLabel)
        return popupLabel
    }()
    
    private lazy var yesButton: UIButton = {
        let yesButton = UIButton()
        yesButton.backgroundColor = .white
        yesButton.setTitle("კი", for: .normal)
        yesButton.setTitleColor(.black, for: .normal)
        yesButton.layer.cornerRadius = 17
        yesButton.addTarget(self, action: #selector(yesButtonTapped), for: .touchUpInside)
        yesButton.translatesAutoresizingMaskIntoConstraints = false
        popupView.addSubview(yesButton)
        return yesButton
    }()
    
    private lazy var noButton: UIButton = {
        let noButton = UIButton()
        noButton.backgroundColor = .white
        noButton.setTitle("არა", for: .normal)
        noButton.setTitleColor(.black, for: .normal)
        noButton.layer.cornerRadius = 17
        noButton.addTarget(self, action: #selector(yesButtonTapped), for: .touchUpInside)
        noButton.translatesAutoresizingMaskIntoConstraints = false
        popupView.addSubview(noButton)
        return noButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(white: 0, alpha: 0.5)
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
    
    private func setupPopupViewConstraints() {
        NSLayoutConstraint.activate([
            popupView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            popupView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            popupView.widthAnchor.constraint(equalToConstant: 270),
            popupView.heightAnchor.constraint(equalToConstant: 176)
        ])
    }
    
    private func setupPopupLabelConstraints() {
        NSLayoutConstraint.activate([
            popupLabel.topAnchor.constraint(equalTo: popupView.topAnchor, constant: 38),
            popupLabel.leadingAnchor.constraint(equalTo: popupView.leadingAnchor, constant: 24),
            popupLabel.trailingAnchor.constraint(equalTo: popupView.trailingAnchor, constant: -24)
        ])
    }
    
    private func setupYesButtonConstraints() {
        NSLayoutConstraint.activate([
            yesButton.widthAnchor.constraint(equalToConstant: 106),
            yesButton.heightAnchor.constraint(equalToConstant: 34),
            yesButton.topAnchor.constraint(equalTo: popupLabel.bottomAnchor, constant: 42),
            yesButton.leadingAnchor.constraint(equalTo: popupView.leadingAnchor, constant: 24)
        ])
    }
    
    private func setupNoButtonConstraints() {
        NSLayoutConstraint.activate([
            noButton.widthAnchor.constraint(equalToConstant: 106),
            noButton.heightAnchor.constraint(equalToConstant: 34),
            noButton.topAnchor.constraint(equalTo: popupLabel.bottomAnchor, constant: 42),
            noButton.trailingAnchor.constraint(equalTo: popupView.trailingAnchor, constant: -24)
        ])
    }
    
}
