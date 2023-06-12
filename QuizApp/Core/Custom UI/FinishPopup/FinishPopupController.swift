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
        popupView.backgroundColor = Constants.PopupView.backgroundColor
        popupView.layer.cornerRadius = Constants.PopupView.cornerRadius
        popupView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(popupView)
        return popupView
    }()
    
    private lazy var successIcon: UIImageView = {
        let successIcon = UIImageView()
        successIcon.image = Constants.SuccessIcon.image
        successIcon.contentMode = .scaleAspectFill
        successIcon.translatesAutoresizingMaskIntoConstraints = false
        popupView.addSubview(successIcon)
        return successIcon
    }()
    
    private lazy var popupLabel: UILabel = {
        let popupLabel = UILabel()
        popupLabel.text = Constants.PopupLabel.text
        popupLabel.backgroundColor = .clear
        popupLabel.font = .systemFont(ofSize: Constants.PopupLabel.font)
        popupLabel.textColor = .white
        popupLabel.translatesAutoresizingMaskIntoConstraints = false
        popupView.addSubview(popupLabel)
        return popupLabel
    }()
    
    private lazy var popupScoreLabel: UILabel = {
        let popupScoreLabel = UILabel()
        popupScoreLabel.text = Constants.PopupScoreLabel.text
        popupScoreLabel.backgroundColor = .clear
        popupScoreLabel.font = .systemFont(ofSize: Constants.PopupScoreLabel.font)
        popupScoreLabel.textColor = Constants.PopupScoreLabel.textColor
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
            popupView.widthAnchor.constraint(equalToConstant: Constants.PopupView.widthAnchor),
            popupView.heightAnchor.constraint(equalToConstant: Constants.PopupView.heightAnchor)
        ])
    }
    
    private func setupSuccessIconConstraints() {
        NSLayoutConstraint.activate([
            successIcon.centerXAnchor.constraint(equalTo: popupView.centerXAnchor),
            successIcon.topAnchor.constraint(equalTo: popupView.topAnchor, constant: Constants.SuccessIcon.topAnchor)
        ])
    }
    
    private func setupPopupLabelConstraints() {
        NSLayoutConstraint.activate([
            popupLabel.centerXAnchor.constraint(equalTo: popupView.centerXAnchor),
            popupLabel.topAnchor.constraint(equalTo: successIcon.bottomAnchor, constant: Constants.PopupLabel.topAnchor)
        ])
    }
    
    private func setupPopupScoreLabelConstraints() {
        NSLayoutConstraint.activate([
            popupScoreLabel.centerXAnchor.constraint(equalTo: popupView.centerXAnchor),
            popupScoreLabel.topAnchor.constraint(equalTo: popupLabel.bottomAnchor, constant: Constants.PopupScoreLabel.topAnchor)
        ])
    }
    
    private func setupDividerViewConstraints() {
        NSLayoutConstraint.activate([
            dividerView.topAnchor.constraint(equalTo: popupScoreLabel.bottomAnchor, constant: Constants.DividerView.topAnchor),
            dividerView.leadingAnchor.constraint(equalTo: popupView.leadingAnchor),
            dividerView.trailingAnchor.constraint(equalTo: popupView.trailingAnchor),
            dividerView.heightAnchor.constraint(equalToConstant: Constants.DividerView.heightAnchor)
        ])
    }
    
    private func setupCloseButtonConstraints() {
        NSLayoutConstraint.activate([
            closeButton.widthAnchor.constraint(equalToConstant: Constants.CloseButton.widthAnchor),
            closeButton.heightAnchor.constraint(equalToConstant: Constants.CloseButton.heightAnchor),
            closeButton.centerXAnchor.constraint(equalTo: popupView.centerXAnchor),
            closeButton.topAnchor.constraint(equalTo: dividerView.bottomAnchor, constant: Constants.CloseButton.topAnchor)
        ])
    }
}

extension FinishPopupController {
    enum Constants {
        enum PopupView {
            static let backgroundColor = UIColor(hex: "FFC44A")
            static let cornerRadius: CGFloat = 10
            static let widthAnchor: CGFloat = 270
            static let heightAnchor: CGFloat = 176
        }
        enum PopupLabel {
            static let text = "გილოცავ"
            static let font: CGFloat = 18
            static let topAnchor: CGFloat = 10
        }
        enum CloseButton {
            static let setTitle = "დახურვა"
            static let widthAnchor: CGFloat = 106
            static let heightAnchor: CGFloat = 34
            static let topAnchor: CGFloat = 4
        }
        enum SuccessIcon {
            static let image = UIImage(named: "successIcon")
            static let topAnchor: CGFloat = 20
        }
        enum PopupScoreLabel {
            static let text = "თქვენ დააგროვეთ 14 ქულა"
            static let font: CGFloat = 18
            static let topAnchor: CGFloat = 4
            static let textColor = UIColor(hex: "537FE7")
        }
        enum DividerView {
            static let heightAnchor: CGFloat = 1
            static let topAnchor: CGFloat = 20
        }
    }
}
