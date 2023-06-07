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
        containerView.backgroundColor = UIColor(hex: "F6F6F6")
        containerView.layer.cornerRadius = 22
        containerView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(containerView)
        return containerView
    }()
    
    private lazy var answerLabel: UILabel = {
        let answerLabel = UILabel()
        answerLabel.backgroundColor = .clear
        answerLabel.font = .systemFont(ofSize: 16)
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
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 2),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 16),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -16),
            containerView.widthAnchor.constraint(equalToConstant: 340),
            containerView.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    private func setupAnswerLabelConstraints() {
        NSLayoutConstraint.activate([
            answerLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 22),
            answerLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -22),
            answerLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 30)
        ])
    }
    
    func configure(with answer: String) {
        answerLabel.text = answer
    }
}
