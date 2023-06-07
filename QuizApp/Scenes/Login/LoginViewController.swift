//
//  LoginViewController.swift
//  QuizApp
//
//  Created by Giorgi Makadze on 02.06.2023.
//

import UIKit

class LoginViewController: UIViewController {
    
    private lazy var coverImageView: UIImageView = {
        let coverImageView = UIImageView()
        coverImageView.image = Constants.CoverImageView.image
        coverImageView.contentMode = .scaleAspectFill
        view.addSubview(coverImageView)
        coverImageView.translatesAutoresizingMaskIntoConstraints = false
        return coverImageView
    }()
    
    private lazy var loginTextView: UITextView = {
        let loginTextView = UITextView()
        loginTextView.backgroundColor = .clear
        loginTextView.font = .systemFont(ofSize: Constants.LoginTextView.font)
        loginTextView.text = Constants.LoginTextView.text
        loginTextView.textColor = Constants.LoginTextView.textColor
        loginTextView.layer.borderColor = Constants.LoginTextView.borderColor
        loginTextView.layer.borderWidth = Constants.LoginTextView.borderWidth
        loginTextView.textAlignment = .center
        loginTextView.layer.cornerRadius = Constants.LoginTextView.cornerRadius
        loginTextView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(loginTextView)
        return loginTextView
    }()
    
    private lazy var startButton: UIButton = {
        let startButton = UIButton(type: .custom)
        startButton.layer.cornerRadius = Constants.StartButton.cornerRadius
        startButton.setImage(Constants.StartButton.setImage, for: .normal)
        startButton.addTarget(self, action: #selector(startButtonTapped),  for: .touchUpInside)
        startButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(startButton)
        return startButton
    }()
    
    private lazy var coverLabel: UITextView = {
        let coverLabel = UITextView()
        coverLabel.text = Constants.CoverLabel.text
        coverLabel.backgroundColor = .clear
        coverLabel.font = .systemFont(ofSize: Constants.CoverLabel.font)
        coverLabel.textColor = .white
        coverLabel.textAlignment = .center
        coverLabel.translatesAutoresizingMaskIntoConstraints = false
        coverImageView.addSubview(coverLabel)
        return coverLabel
    }()
    
    private lazy var coverIcon: UIImageView = {
        let coverIcon = UIImageView()
        coverIcon.image = Constants.CoverIcon.image
        coverIcon.contentMode = .scaleAspectFill
        coverIcon.translatesAutoresizingMaskIntoConstraints = false
        coverImageView.addSubview(coverIcon)
        return coverIcon
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupCoverImageViewConstraints()
        setupLoginTextViewConstraints()
        setupStartButton()
        setupCoverLabelConstraints()
        setupCoverIconConstraints()
    }
    
    @objc func startButtonTapped() {
        let homeViewController = HomeViewController()
        self.navigationController?.pushViewController(homeViewController, animated: true)
    }
    
    private func setupCoverImageViewConstraints() {
        NSLayoutConstraint.activate([
            //            coverImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            coverImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            coverImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            coverImageView.bottomAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
    
    private func setupLoginTextViewConstraints() {
        NSLayoutConstraint.activate([
            loginTextView.topAnchor.constraint(equalTo: coverImageView.bottomAnchor, constant: Constants.LoginTextView.topAnchor),
            loginTextView.widthAnchor.constraint(equalToConstant: Constants.LoginTextView.widthAnchor),
            loginTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    private func setupStartButton() {
        NSLayoutConstraint.activate([
            startButton.topAnchor.constraint(equalTo: loginTextView.bottomAnchor, constant: Constants.StartButton.topAnchor),
            startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            startButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: Constants.StartButton.bottomAnchor)
        ])
    }
    
    private func setupCoverLabelConstraints() {
        NSLayoutConstraint.activate([
            coverLabel.leadingAnchor.constraint(equalTo: coverImageView.leadingAnchor, constant: Constants.CoverLabel.leadingAnchor),
            coverLabel.trailingAnchor.constraint(equalTo: coverImageView.trailingAnchor, constant: Constants.CoverLabel.trailingAnchor),
            coverLabel.topAnchor.constraint(equalTo: coverImageView.topAnchor, constant: Constants.CoverLabel.topAnchor),
            //text.bottomAnchor.constraint(equalTo: firstView.bottomAnchor, constant: 40)
        ])
    }
    
    private func setupCoverIconConstraints() {
        NSLayoutConstraint.activate([
            coverIcon.topAnchor.constraint(equalTo: coverLabel.bottomAnchor, constant: Constants.CoverIcon.topAnchor),
            coverIcon.leadingAnchor.constraint(equalTo: coverImageView.leadingAnchor, constant: Constants.CoverIcon.leadingAnchor),
            coverIcon.trailingAnchor.constraint(equalTo: coverImageView.trailingAnchor, constant: Constants.CoverIcon.trailingAnchor),
            coverIcon.bottomAnchor.constraint(equalTo: coverImageView.bottomAnchor, constant: Constants.CoverIcon.bottomAnchor)
        ])
    }
}

extension LoginViewController {
    enum Constants {
        enum CoverImageView {
            static let image = UIImage(named: "Blue")
        }
        enum LoginTextView {
            static let font: CGFloat = 14
            static let text = "შეიყვანე სახელი"
            static let textColor = UIColor(hex: "C7C7C7")
            static let borderColor = UIColor(hex: "FFC44A").cgColor
            static let borderWidth: CGFloat = 1.0
            static let cornerRadius: CGFloat = 12
            static let topAnchor: CGFloat = 130
            static let widthAnchor: CGFloat = 270
        }
        enum StartButton {
            static let cornerRadius: CGFloat = 12
            static let setImage = UIImage(named: "StartButton")
            static let topAnchor: CGFloat = 38
            static let bottomAnchor: CGFloat = -170
        }
        enum CoverLabel {
            static let text = "ჩემი პირველი ქვიზი"
            static let font: CGFloat = 20
            static let leadingAnchor: CGFloat = 80
            static let trailingAnchor: CGFloat = -89
            static let topAnchor: CGFloat = 10
        }
        enum CoverIcon {
            static let image = UIImage(named: "Illustration")
            static let topAnchor: CGFloat = 10
            static let leadingAnchor: CGFloat = 20
            static let trailingAnchor: CGFloat = -20
            static let bottomAnchor: CGFloat = -40
        }
    }
}
