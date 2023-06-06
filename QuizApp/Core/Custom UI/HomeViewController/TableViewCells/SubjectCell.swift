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
        containerView.backgroundColor = UIColor(hex: "F6F6F6")
        containerView.layer.cornerRadius = 26
        containerView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(containerView)
        return containerView
    }()
    
    private lazy var iconImageView: UIImageView = {
        let iconImageView = UIImageView()
        //iconImageView.image = UIImage(named: "Globe")
        iconImageView.contentMode = .scaleAspectFill
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(iconImageView)
        return iconImageView
    }()
    
    private lazy var nameLabel: UILabel = {
        let nameLabel = UILabel()
        //nameLabel.text = "გეორგაფია"
        nameLabel.font = .systemFont(ofSize: 16)
        nameLabel.backgroundColor = .clear
        nameLabel.textColor = .black
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(nameLabel)
        return nameLabel
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let descriptionLabel = UILabel()
        //descriptionLabel.text = "აღწერა"
        descriptionLabel.font = .systemFont(ofSize: 10)
        descriptionLabel.backgroundColor = .clear
        descriptionLabel.textColor = UIColor(hex: "B3B3B3")
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(descriptionLabel)
        return descriptionLabel
    }()
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "cellbutton"), for: .normal)
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

    
    func setup() {
        containerViewConstraints()
        iconImageViewConstrains()
        nameLabelConstraints()
        descriptionLabelConstraints()
        buttonConstraints()
    }
    
    @objc func buttonTapped() {
//        delegate?.didTapButton(in: self)
    }
    
    func  containerViewConstraints() {
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 20),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 20),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -20),
            containerView.widthAnchor.constraint(equalToConstant: 344),
            containerView.heightAnchor.constraint(equalToConstant: 106)
        ])
    }
    
    func iconImageViewConstrains() {
        NSLayoutConstraint.activate([
            iconImageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 22),
            iconImageView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -22),
            iconImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 29.5)
        ])
    }
    
    func nameLabelConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 18),
            nameLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 33),
            //firstLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -52)
        ])
    }
    
    func descriptionLabelConstraints() {
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 2),
            descriptionLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 18),
            descriptionLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -34)
        ])
    }
    
    func buttonConstraints() {
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 30),
            button.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -31),
            button.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -29.5)
        ])
    }
    
    func configure(with subject: Subject) {
           iconImageView.image = UIImage(named: subject.icon)
           nameLabel.text = subject.name
           descriptionLabel.text = subject.description
       }
}
