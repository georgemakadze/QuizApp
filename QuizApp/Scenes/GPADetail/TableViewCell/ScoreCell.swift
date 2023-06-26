//
//  ScoreCell.swift
//  QuizApp
//
//  Created by Giorgi Makadze on 06.06.2023.
//

import Foundation
import UIKit

class ScoreCell: UITableViewCell {
    
    //MARK: - Components
    private let containerView: UIView = {
        let containerView = UIView()
        containerView.backgroundColor = Constants.ContainerView.backgroundColor
        containerView.layer.cornerRadius = Constants.ContainerView.cornerRadius
        containerView.translatesAutoresizingMaskIntoConstraints = false
        return containerView
    }()
    
    private let iconImageView: UIImageView = {
        let iconImageView = UIImageView()
        iconImageView.contentMode = .scaleAspectFill
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        return iconImageView
    }()
    
    private let nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.font = .systemFont(ofSize: Constants.NameLabel.font)
        nameLabel.backgroundColor = Constants.NameLabel.backgroundColor
        nameLabel.textColor = Constants.NameLabel.textColor
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        return nameLabel
    }()
    
    private let descriptionLabel: UILabel = {
        let descriptionLabel = UILabel()
        descriptionLabel.font = Constants.DescriptionLabel.font
        descriptionLabel.backgroundColor = Constants.DescriptionLabel.backgroundColor
        descriptionLabel.textColor = Constants.DescriptionLabel.textColor
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        return descriptionLabel
    }()
    
    private let scoreLabel: UILabel = {
        let scoreLabel = UILabel()
        scoreLabel.text = Constants.ScoreLabel.text
        scoreLabel.textColor = Constants.ScoreLabel.textColor
        scoreLabel.font = Constants.ScoreLabel.font
        scoreLabel.textAlignment = .center
        scoreLabel.layer.masksToBounds = true
        scoreLabel.backgroundColor = Constants.ScoreLabel.backgroundColor
        scoreLabel.layer.cornerRadius = Constants.ScoreLabel.cornerRadius
        scoreLabel.translatesAutoresizingMaskIntoConstraints = false
        return scoreLabel
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
        setupIconImageViewConstrains()
        setupNameLabelConstraints()
        setupDescriptionLabelConstraints()
        setupScoreLabelConstraints()
    }
    
    // MARK: - Constraints Setup
    private func  setupContainerViewConstraints() {
        contentView.addSubview(containerView)
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor,constant: Constants.ContainerView.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: Constants.ContainerView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: Constants.ContainerView.trailingAnchor),
            containerView.widthAnchor.constraint(equalToConstant: Constants.ContainerView.widthAnchor),
            containerView.heightAnchor.constraint(equalToConstant: Constants.ContainerView.heightAnchor)
        ])
    }
    
    private func setupIconImageViewConstrains() {
        containerView.addSubview(iconImageView)
        NSLayoutConstraint.activate([
            iconImageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: Constants.IconImageView.topAnchor),
            iconImageView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: Constants.IconImageView.bottomAnchor),
            iconImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: Constants.IconImageView.leadingAnchor)
        ])
    }
    
    private func setupNameLabelConstraints() {
        containerView.addSubview(nameLabel)
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: Constants.NameLabel.leadingAnchor),
            nameLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: Constants.NameLabel.topAnchor),
        ])
    }
    
    private func setupDescriptionLabelConstraints() {
        containerView.addSubview(descriptionLabel)
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: Constants.DescriptionLabel.topAnchor),
            descriptionLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: Constants.DescriptionLabel.leadingAnchor),
            descriptionLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: Constants.DescriptionLabel.bottomAnchor)
        ])
    }
    
    private func setupScoreLabelConstraints() {
        containerView.addSubview(scoreLabel)
        NSLayoutConstraint.activate([
            scoreLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: Constants.ScoreLabel.topAnchor),
            scoreLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: Constants.ScoreLabel.bottomAnchor),
            scoreLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: Constants.ScoreLabel.trailingAnchor),
            scoreLabel.widthAnchor.constraint(equalToConstant: Constants.ScoreLabel.widthAnchor),
            scoreLabel.heightAnchor.constraint(equalToConstant: Constants.ScoreLabel.heightAnchor)
        ])
    }
    
    func configure(with subject: SubjectResult) {
        iconImageView.image = UIImage(named: subject.icon)
        nameLabel.text = subject.name
        descriptionLabel.text = subject.description
    }
}

//MARK: - Constants
private extension ScoreCell {
    enum Constants {
        enum ContainerView {
            static let backgroundColor = UIColor(hex: "F6F6F6")
            static let cornerRadius: CGFloat = 26
            static let topAnchor: CGFloat = 20
            static let leadingAnchor: CGFloat = 20
            static let trailingAnchor: CGFloat = -20
            static let widthAnchor: CGFloat = 344
            static let heightAnchor: CGFloat = 106
        }
        enum IconImageView {
            static let topAnchor: CGFloat = 22
            static let bottomAnchor: CGFloat = -22
            static let leadingAnchor: CGFloat = 29.5
        }
        enum NameLabel {
            static let backgroundColor: UIColor = .clear
            static let textColor: UIColor = .black
            static let font: CGFloat = 16
            static let leadingAnchor: CGFloat = 18
            static let topAnchor: CGFloat = 33
        }
        enum DescriptionLabel {
            static let font: UIFont = .systemFont(ofSize: 10)
            static let textColor = UIColor(hex: "B3B3B3")
            static let topAnchor: CGFloat = 2
            static let leadingAnchor: CGFloat = 18
            static let bottomAnchor: CGFloat = -34
            static let backgroundColor: UIColor = .clear
        }
        enum ScoreLabel {
            static let font: UIFont = .systemFont(ofSize: 16)
            static let text = "1"
            static let textColor: UIColor = .white
            static let backgroundColor = UIColor(hex: "FFC44A")
            static let cornerRadius: CGFloat = 22.5
            static let topAnchor: CGFloat = 30
            static let bottomAnchor: CGFloat = -31
            static let trailingAnchor: CGFloat = -29.5
            static let widthAnchor: CGFloat = 45
            static let heightAnchor: CGFloat = 45
        }
    }
}
