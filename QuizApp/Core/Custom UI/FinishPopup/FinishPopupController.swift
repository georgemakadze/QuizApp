//
//  FinishPopup.swift
//  QuizApp
//
//  Created by Giorgi Makadze on 09.06.2023.
//

import Foundation
import UIKit

class FinishPopupController: UIViewController {
    private lazy var popupView: UIView = {
        let popupView = UIView()
        popupView.backgroundColor = UIColor(hex: "FFC44A")
        popupView.layer.cornerRadius = 10
        popupView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(popupView)
        return popupView
    }()
    
    private lazy var successIcon: UIImageView = {
        let successIcon = UIImageView()
        successIcon.image = UIImage(named: "successIcon")
        successIcon.contentMode = .scaleAspectFill
        successIcon.translatesAutoresizingMaskIntoConstraints = false
        popupView.addSubview(successIcon)
        return successIcon
    }()
    
    private lazy var popupLabel: UILabel = {
        let popupLabel = UILabel()
        popupLabel.text = "გილოცავ"
        popupLabel.backgroundColor = .clear
        popupLabel.font = .systemFont(ofSize: 18)
        popupLabel.textColor = .white
        popupLabel.translatesAutoresizingMaskIntoConstraints = false
        popupView.addSubview(popupLabel)
        return popupLabel
    }()
    
    private lazy var popupScoreLabel: UILabel = {
        let popupScoreLabel = UILabel()
        popupScoreLabel.text = "თქვენ დააგროვეთ 14 ქულა"
        popupScoreLabel.backgroundColor = .clear
        popupScoreLabel.font = .systemFont(ofSize: 18)
        popupScoreLabel.textColor = UIColor(hex: "537FE7")
        popupScoreLabel.translatesAutoresizingMaskIntoConstraints = false
        popupView.addSubview(popupScoreLabel)
        return popupScoreLabel
    }()
    
    private lazy var dividerView: UIView = {
        let dividerView = UIView()
        dividerView.backgroundColor = .white
        dividerView.translatesAutoresizingMaskIntoConstraints = false
        popupView.addSubview(dividerView)
        return dividerView
    }()
    
    private lazy var closeButton: UIButton = {
        let closeButton = UIButton()
        closeButton.backgroundColor = .clear
        closeButton.setTitle("დახურვა", for: .normal)
        closeButton.setTitleColor(.white, for: .normal)
        closeButton.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        popupView.addSubview(closeButton)
        return closeButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(white: 0, alpha: 0.5)
        setupPopupViewConstraints()
        setupSuccessIconConstraints()
        setupPopupLabelConstraints()
        setupPopupScoreLabelConstraints()
        setupDividerViewConstraints()
        setupCloseButtonConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    @objc func closeButtonTapped() {
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
    
    private func setupSuccessIconConstraints() {
        NSLayoutConstraint.activate([
            successIcon.centerXAnchor.constraint(equalTo: popupView.centerXAnchor),
            successIcon.topAnchor.constraint(equalTo: popupView.topAnchor, constant: 20)
        ])
    }
    
    private func setupPopupLabelConstraints() {
        NSLayoutConstraint.activate([
            popupLabel.centerXAnchor.constraint(equalTo: popupView.centerXAnchor),
            popupLabel.topAnchor.constraint(equalTo: successIcon.bottomAnchor, constant: 10)
        ])
    }
    
    private func setupPopupScoreLabelConstraints() {
        NSLayoutConstraint.activate([
            popupScoreLabel.centerXAnchor.constraint(equalTo: popupView.centerXAnchor),
            popupScoreLabel.topAnchor.constraint(equalTo: popupLabel.bottomAnchor, constant: 4)
        ])
    }
    
    private func setupDividerViewConstraints() {
        NSLayoutConstraint.activate([
            dividerView.topAnchor.constraint(equalTo: popupScoreLabel.bottomAnchor, constant: 20),
            dividerView.leadingAnchor.constraint(equalTo: popupView.leadingAnchor),
            dividerView.trailingAnchor.constraint(equalTo: popupView.trailingAnchor),
            dividerView.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
    
    private func setupCloseButtonConstraints() {
        NSLayoutConstraint.activate([
            closeButton.widthAnchor.constraint(equalToConstant: 106),
            closeButton.heightAnchor.constraint(equalToConstant: 34),
            closeButton.centerXAnchor.constraint(equalTo: popupView.centerXAnchor),
            closeButton.topAnchor.constraint(equalTo: dividerView.bottomAnchor, constant: 4)
            
        ])
    }
    
}
