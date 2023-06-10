//
//  SubjectCell.swift
//  QuizApp
//
//  Created by Giorgi Makadze on 05.06.2023.
//

import Foundation
import UIKit

//protocol SubjectCellDelegate: AnyObject {
//    func didTapButton(in cell: SubjectCell)
//}

class SubjectCell: UITableViewCell {
    
    private lazy var containerView: UIView = {
        let containerView = UIView()
        containerView.backgroundColor = Constants.ContainerView.backgroundColor
        containerView.layer.cornerRadius = Constants.ContainerView.cornerRadius
        containerView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(containerView)
        return containerView
    }()
    
    private lazy var iconImageView: UIImageView = {
        let iconImageView = UIImageView()
        iconImageView.contentMode = .scaleAspectFill
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(iconImageView)
        return iconImageView
    }()
    
    private lazy var nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.font = .systemFont(ofSize: Constants.NameLabel.font)
        nameLabel.backgroundColor = .clear
        nameLabel.textColor = .black
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(nameLabel)
        return nameLabel
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let descriptionLabel = UILabel()
        descriptionLabel.font = .systemFont(ofSize: Constants.DescriptionLabel.font)
        descriptionLabel.backgroundColor = .clear
        descriptionLabel.textColor = Constants.DescriptionLabel.textColor
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(descriptionLabel)
        return descriptionLabel
    }()
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.setImage(Constants.Button.setImage, for: .normal)
        button.addTarget(self, action: #selector(buttonTapped),  for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(button)
        return button
    }()
    
    //    weak var delegate: SubjectCellDelegate?
    
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
        setupIconImageViewConstrains()
        setupNameLabelConstraints()
        setupDescriptionLabelConstraints()
        setupButtonConstraints()
    }
    
    @objc func buttonTapped() {
        //        delegate?.didTapButton(in: self)
    }
    
    private func  setupContainerViewConstraints() {
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor,constant: Constants.ContainerView.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: Constants.ContainerView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: Constants.ContainerView.trailingAnchor),
            //            containerView.widthAnchor.constraint(equalToConstant: Constants.ContainerView.widthAnchor),
            //            containerView.heightAnchor.constraint(equalToConstant: Constants.ContainerView.heightAnchor)
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: Constants.ContainerView.bottomAnchor)
        ])
    }
    
    private func setupIconImageViewConstrains() {
        NSLayoutConstraint.activate([
            iconImageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: Constants.IconImageView.topAnchor),
            iconImageView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: Constants.IconImageView.bottomAnchor),
            iconImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: Constants.IconImageView.leadingAnchor)
        ])
    }
    
    private func setupNameLabelConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: Constants.NameLabel.leadingAnchor),
            nameLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: Constants.NameLabel.topAnchor),
        ])
    }
    
    private func setupDescriptionLabelConstraints() {
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: Constants.DescriptionLabel.topAnchor),
            descriptionLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: Constants.DescriptionLabel.leadingAnchor),
            descriptionLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: Constants.DescriptionLabel.bottomAnchor)
        ])
    }
    
    private func setupButtonConstraints() {
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: containerView.topAnchor, constant: Constants.Button.topAnchor),
            button.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: Constants.Button.bottomAnchor),
            button.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: Constants.Button.trailingAnchor)
        ])
    }
    
    func configure(with subject: Subject) {
        iconImageView.image = UIImage(named: subject.icon)
        nameLabel.text = subject.name
        descriptionLabel.text = subject.description
    }
}

extension SubjectCell {
    enum Constants {
        enum ContainerView {
            static let backgroundColor = UIColor(hex: "F6F6F6")
            static let cornerRadius: CGFloat = 26
            static let topAnchor: CGFloat = 9
            static let leadingAnchor: CGFloat = 20
            static let trailingAnchor: CGFloat = -20
            static let widthAnchor: CGFloat = 344
            static let heightAnchor: CGFloat = 106
            static let bottomAnchor: CGFloat = -9
        }
        enum IconImageView {
            static let topAnchor: CGFloat = 22
            static let bottomAnchor: CGFloat = -22
            static let leadingAnchor: CGFloat = 29.5
        }
        enum NameLabel {
            static let font: CGFloat = 16
            static let leadingAnchor: CGFloat = 18
            static let topAnchor: CGFloat = 33
        }
        enum DescriptionLabel {
            static let font: CGFloat = 10
            static let textColor = UIColor(hex: "B3B3B3")
            static let topAnchor: CGFloat = 2
            static let leadingAnchor: CGFloat = 18
            static let bottomAnchor: CGFloat = -34
        }
        enum Button {
            static let setImage = UIImage(named: "cellbutton")
            static let topAnchor: CGFloat = 30
            static let bottomAnchor: CGFloat = -31
            static let trailingAnchor: CGFloat = -29.5
        }
    }
}
