//
//  AnswerCell.swift
//  QuizApp
//
//  Created by Giorgi Makadze on 06.06.2023.
//

import Foundation
import UIKit

class AnswerCell: UITableViewCell {
    
    //MARK: Components
    private lazy var containerView: UIView = {
        let containerView = UIView()
        containerView.backgroundColor = Constants.ContainerView.backgroundColor
        containerView.layer.cornerRadius = Constants.ContainerView.cornerRadius
        containerView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(containerView)
        return containerView
    }()
    
    private lazy var answerLabel: UILabel = {
        let answerLabel = UILabel()
        answerLabel.backgroundColor = Constants.AnswerLabel.backgroundColor
        answerLabel.font = .systemFont(ofSize: Constants.AnswerLabel.font)
        answerLabel.textColor = Constants.AnswerLabel.textColor
        answerLabel.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(answerLabel)
        return answerLabel
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("error!")
    }
    
    private func setup() {
        setupContainerViewConstraints()
        setupAnswerLabelConstraints()
    }
    
    // MARK: - Constraints Setup
    private func setupContainerViewConstraints() {
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor,constant: Constants.ContainerView.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: Constants.ContainerView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: Constants.ContainerView.trailingAnchor),
            containerView.widthAnchor.constraint(equalToConstant: Constants.ContainerView.widthAnchor),
            containerView.heightAnchor.constraint(equalToConstant: Constants.ContainerView.heightAnchor)
        ])
    }
    
    private func setupAnswerLabelConstraints() {
        NSLayoutConstraint.activate([
            answerLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: Constants.AnswerLabel.topAnchor),
            answerLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: Constants.AnswerLabel.bottomAnchor),
            answerLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: Constants.AnswerLabel.leadingAnchor)
        ])
    }
    
    func configure(with answer: String) {
        answerLabel.text = answer
    }
}

//MARK: - Constants
private extension AnswerCell {
    enum Constants {
        enum ContainerView {
            static let backgroundColor = UIColor(hex: "F6F6F6")
            static let cornerRadius: CGFloat = 22
            static let topAnchor: CGFloat = 2
            static let leadingAnchor: CGFloat = 16
            static let trailingAnchor: CGFloat = -16
            static let widthAnchor: CGFloat = 340
            static let heightAnchor: CGFloat = 60
        }
        enum AnswerLabel {
            static let backgroundColor: UIColor = .clear
            static let textColor: UIColor = .black
            static let font: CGFloat = 16
            static let topAnchor: CGFloat = 22
            static let bottomAnchor: CGFloat = -22
            static let leadingAnchor: CGFloat = 30
        }
    }
}
