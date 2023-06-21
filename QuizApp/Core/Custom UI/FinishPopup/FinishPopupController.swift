//
//  FinishPopup.swift
//  QuizApp
//
//  Created by Giorgi Makadze on 09.06.2023.
//

import Foundation
import UIKit

protocol FinishPopupControllerDelegate: AnyObject {
    func didTapCloseButton()
}

class FinishPopupController: UIViewController {
    
    //MARK: -  Components
    private let popupView: UIView = {
        let popupView = UIView()
        popupView.backgroundColor = Constants.PopupView.backgroundColor
        popupView.layer.cornerRadius = Constants.PopupView.cornerRadius
        popupView.translatesAutoresizingMaskIntoConstraints = false
        return popupView
    }()
    
    private let successIcon: UIImageView = {
        let successIcon = UIImageView()
        successIcon.image = Constants.SuccessIcon.image
        successIcon.contentMode = .scaleAspectFill
        successIcon.translatesAutoresizingMaskIntoConstraints = false
        return successIcon
    }()
    
    private let popupLabel: UILabel = {
        let popupLabel = UILabel()
        popupLabel.text = Constants.PopupLabel.text
        popupLabel.backgroundColor = Constants.PopupLabel.backgroundColor
        popupLabel.font = Constants.PopupLabel.font
        popupLabel.textColor = Constants.PopupLabel.textColor
        popupLabel.translatesAutoresizingMaskIntoConstraints = false
        return popupLabel
    }()
    
    private let popupScoreLabel: UILabel = {
        let popupScoreLabel = UILabel()
        popupScoreLabel.text = Constants.PopupScoreLabel.text
        popupScoreLabel.backgroundColor = Constants.PopupScoreLabel.backgroundColor
        popupScoreLabel.font = Constants.PopupScoreLabel.font
        popupScoreLabel.textColor = Constants.PopupScoreLabel.textColor
        popupScoreLabel.translatesAutoresizingMaskIntoConstraints = false
        return popupScoreLabel
    }()
    
    private let dividerView: UIView = {
        let dividerView = UIView()
        dividerView.backgroundColor = Constants.DividerView.backgroundColor
        dividerView.translatesAutoresizingMaskIntoConstraints = false
        return dividerView
    }()
    
    private lazy var closeButton: UIButton = {
        let closeButton = UIButton()
        closeButton.backgroundColor = Constants.CloseButton.backgroundColor
        closeButton.setTitle(Constants.CloseButton.title, for: .normal)
        closeButton.setTitleColor(Constants.CloseButton.titleColor, for: .normal)
        closeButton.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        return closeButton
    }()
    
    weak var delegate: FinishPopupControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Constants.View.backgroundColor
        setupPopupViewConstraints()
        setupSuccessIconConstraints()
        setupPopupLabelConstraints()
        setupPopupScoreLabelConstraints()
        setupDividerViewConstraints()
        setupCloseButtonConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("error")
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    //MARK: - Action
    @objc func closeButtonTapped() {
        delegate?.didTapCloseButton()
        dismiss(animated: true, completion: nil)
    }
    
    //MARK: - Constraints Setup
    private func setupPopupViewConstraints() {
        view.addSubview(popupView)
        NSLayoutConstraint.activate([
            popupView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            popupView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            popupView.widthAnchor.constraint(equalToConstant: Constants.PopupView.widthAnchor),
            popupView.heightAnchor.constraint(equalToConstant: Constants.PopupView.heightAnchor)
        ])
    }
    
    private func setupSuccessIconConstraints() {
        popupView.addSubview(successIcon)
        NSLayoutConstraint.activate([
            successIcon.centerXAnchor.constraint(equalTo: popupView.centerXAnchor),
            successIcon.topAnchor.constraint(equalTo: popupView.topAnchor, constant: Constants.SuccessIcon.topAnchor)
        ])
    }
    
    private func setupPopupLabelConstraints() {
        popupView.addSubview(popupLabel)
        NSLayoutConstraint.activate([
            popupLabel.centerXAnchor.constraint(equalTo: popupView.centerXAnchor),
            popupLabel.topAnchor.constraint(equalTo: successIcon.bottomAnchor, constant: Constants.PopupLabel.topAnchor)
        ])
    }
    
    private func setupPopupScoreLabelConstraints() {
        popupView.addSubview(popupScoreLabel)
        NSLayoutConstraint.activate([
            popupScoreLabel.centerXAnchor.constraint(equalTo: popupView.centerXAnchor),
            popupScoreLabel.topAnchor.constraint(equalTo: popupLabel.bottomAnchor, constant: Constants.PopupScoreLabel.topAnchor)
        ])
    }
    
    private func setupDividerViewConstraints() {
        popupView.addSubview(dividerView)
        NSLayoutConstraint.activate([
            dividerView.topAnchor.constraint(equalTo: popupScoreLabel.bottomAnchor, constant: Constants.DividerView.topAnchor),
            dividerView.leadingAnchor.constraint(equalTo: popupView.leadingAnchor),
            dividerView.trailingAnchor.constraint(equalTo: popupView.trailingAnchor),
            dividerView.heightAnchor.constraint(equalToConstant: Constants.DividerView.heightAnchor)
        ])
    }
    
    private func setupCloseButtonConstraints() {
        popupView.addSubview(closeButton)
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            closeButton.widthAnchor.constraint(equalToConstant: Constants.CloseButton.widthAnchor),
            closeButton.heightAnchor.constraint(equalToConstant: Constants.CloseButton.heightAnchor),
            closeButton.centerXAnchor.constraint(equalTo: popupView.centerXAnchor),
            closeButton.topAnchor.constraint(equalTo: dividerView.bottomAnchor, constant: Constants.CloseButton.topAnchor)
        ])
    }
}

//MARK: - Constants
private extension FinishPopupController {
    enum Constants {
        
        enum PopupView {
            static let backgroundColor = UIColor(hex: "FFC44A")
            static let cornerRadius: CGFloat = 10
            static let widthAnchor: CGFloat = 270
            static let heightAnchor: CGFloat = 176
        }
        
        enum PopupLabel {
            static let backgroundColor: UIColor = .clear
            static let textColor: UIColor = .white
            static let text = "გილოცავ"
            static let font: UIFont = .systemFont(ofSize: 18)
            static let topAnchor: CGFloat = 10
        }
        
        enum CloseButton {
            static let titleColor: UIColor = .white
            static let title = "დახურვა"
            static let backgroundColor: UIColor = .clear
            static let widthAnchor: CGFloat = 106
            static let heightAnchor: CGFloat = 34
            static let topAnchor: CGFloat = 4
        }
        
        enum SuccessIcon {
            static let image = UIImage(named: "successIcon")
            static let topAnchor: CGFloat = 20
        }
        
        enum PopupScoreLabel {
            static let backgroundColor: UIColor = .clear
            static let text = "თქვენ დააგროვეთ 14 ქულა"
            static let font: UIFont = .systemFont(ofSize: 18)
            static let topAnchor: CGFloat = 4
            static let textColor = UIColor(hex: "537FE7")
        }
        
        enum DividerView {
            static let backgroundColor: UIColor = .white
            static let heightAnchor: CGFloat = 1
            static let topAnchor: CGFloat = 20
        }
        
        enum View {
            static let backgroundColor: UIColor = UIColor(white: 0, alpha: 0.5)
        }
    }
}
