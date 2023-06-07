//
//  AnswerCell.swift
//  QuizApp
//
//  Created by Giorgi Makadze on 06.06.2023.
//

import Foundation
import UIKit

class AnswerCell: UITableViewCell {
    
    private lazy var containerView: UIView = {
        let containerView = UIView()
        containerView.backgroundColor = Constans.ContainerView.backgroundColor
        containerView.layer.cornerRadius = Constans.ContainerView.cornerRadius
        containerView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(containerView)
        return containerView
    }()
    
    private lazy var answerLabel: UILabel = {
        let answerLabel = UILabel()
        answerLabel.backgroundColor = .clear
        answerLabel.font = .systemFont(ofSize: Constans.AnswerLabel.font)
        answerLabel.textColor = .black
        answerLabel.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(answerLabel)
        return answerLabel
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        setupContainerViewConstraints()
        setupAnswerLabelConstraints()
    }
    
    private func setupContainerViewConstraints() {
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor,constant: Constans.ContainerView.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: Constans.ContainerView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: Constans.ContainerView.trailingAnchor),
            containerView.widthAnchor.constraint(equalToConstant: Constans.ContainerView.widthAnchor),
            containerView.heightAnchor.constraint(equalToConstant: Constans.ContainerView.heightAnchor)
        ])
    }
    
    private func setupAnswerLabelConstraints() {
        NSLayoutConstraint.activate([
            answerLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: Constans.AnswerLabel.topAnchor),
            answerLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: Constans.AnswerLabel.bottomAnchor),
            answerLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: Constans.AnswerLabel.leadingAnchor)
        ])
    }
    
    func configure(with answer: String) {
        answerLabel.text = answer
    }
}

extension AnswerCell {
    enum Constans {
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
            static let font: CGFloat = 16
            static let topAnchor: CGFloat = 22
            static let bottomAnchor: CGFloat = -22
            static let leadingAnchor: CGFloat = 30
        }
    }
}
