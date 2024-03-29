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
    private let containerView: UIView = {
        let containerView = UIView()
        containerView.backgroundColor = Constants.ContainerView.backgroundColor
        containerView.layer.cornerRadius = Constants.ContainerView.cornerRadius
        containerView.translatesAutoresizingMaskIntoConstraints = false
        return containerView
    }()
    
    private let answerLabel: UILabel = {
        let answerLabel = UILabel()
        answerLabel.backgroundColor = Constants.AnswerLabel.backgroundColor
        answerLabel.font = .systemFont(ofSize: Constants.AnswerLabel.font)
        answerLabel.textColor = Constants.AnswerLabel.textColor
        answerLabel.translatesAutoresizingMaskIntoConstraints = false
        return answerLabel
    }()
    
    let scoreImage: UIImageView = {
        let scoreImage = UIImageView()
        scoreImage.image = Constants.ScoreImage.image
        scoreImage.isHidden = true
        scoreImage.translatesAutoresizingMaskIntoConstraints = false
        return scoreImage
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
        setupScoreImageConstraints()
    }
    
    // MARK: - Constraints Setup
    private func setupContainerViewConstraints() {
        contentView.addSubview(containerView)
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor,constant: Constants.ContainerView.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: Constants.ContainerView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: Constants.ContainerView.trailingAnchor),
            containerView.widthAnchor.constraint(equalToConstant: Constants.ContainerView.widthAnchor),
            containerView.heightAnchor.constraint(equalToConstant: Constants.ContainerView.heightAnchor)
        ])
    }
    
    private func setupAnswerLabelConstraints() {
        containerView.addSubview(answerLabel)
        NSLayoutConstraint.activate([
            answerLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: Constants.AnswerLabel.topAnchor),
            answerLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: Constants.AnswerLabel.bottomAnchor),
            answerLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: Constants.AnswerLabel.leadingAnchor)
        ])
    }
    
    private func setupScoreImageConstraints() {
        containerView.addSubview(scoreImage)
        NSLayoutConstraint.activate([
            scoreImage.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: Constants.ScoreImage.trailingAnchor),
            scoreImage.topAnchor.constraint(equalTo: containerView.topAnchor,constant: Constants.ScoreImage.topAnchor),
            scoreImage.widthAnchor.constraint(equalToConstant: Constants.ScoreImage.widthAnchor),
            scoreImage.heightAnchor.constraint(equalToConstant: Constants.ScoreImage.heightAnchor)
        ])
    }
    
    func configure(with answer: String) {
        answerLabel.text = answer
        containerView.backgroundColor = Constants.ContainerView.backgroundColor
        scoreImage.isHidden = true
    }
    
    func changeBackgroundColor(isCorrect: Bool) {
        containerView.backgroundColor = isCorrect ? .green : .red
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
            static let topAnchor: CGFloat = 16
            static let bottomAnchor: CGFloat = -16
            static let leadingAnchor: CGFloat = 30
        }
        
        enum ScoreImage {
            static let image = UIImage(named: "score")
            static let trailingAnchor: CGFloat = -20
            static let topAnchor: CGFloat = 20
            static let widthAnchor: CGFloat = 32
            static let heightAnchor: CGFloat = 18
        }
    }
}
