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
        coverImageView.image = UIImage(named: "Blue")
        coverImageView.contentMode = .scaleAspectFill
        view.addSubview(coverImageView)
        coverImageView.translatesAutoresizingMaskIntoConstraints = false
        return coverImageView
    }()
    
    private lazy var loginTextView: UITextView = {
        let loginTextView = UITextView()
        loginTextView.backgroundColor = .clear
        loginTextView.font = .systemFont(ofSize: 14)
        loginTextView.text = "შეიყვანე სახელი"
        loginTextView.textColor = UIColor(hex: "C7C7C7")
        loginTextView.layer.borderColor = UIColor(hex: "FFC44A").cgColor
        loginTextView.layer.borderWidth = 1.0
        loginTextView.textAlignment = .center
        loginTextView.layer.cornerRadius = 12
        loginTextView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(loginTextView)
        return loginTextView
    }()
    
    private lazy var startButton: UIButton = {
        let startButton = UIButton(type: .custom)
        startButton.layer.cornerRadius = 12
        startButton.setImage(UIImage(named: "StartButton"), for: .normal)
        startButton.addTarget(self, action: #selector(startButtonTapped),  for: .touchUpInside)
        startButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(startButton)
        return startButton
    }()
    
    private lazy var coverLabel: UITextView = {
        let coverLabel = UITextView()
        coverLabel.text = "ჩემი პირველი ქვიზი"
        coverLabel.backgroundColor = .clear
        coverLabel.font = .systemFont(ofSize: 20)
        coverLabel.textColor = .white
        coverLabel.textAlignment = .center
        coverLabel.translatesAutoresizingMaskIntoConstraints = false
        coverImageView.addSubview(coverLabel)
        return coverLabel
    }()
    
    private lazy var coverIcon: UIImageView = {
        let coverIcon = UIImageView()
        coverIcon.image = UIImage(named: "Illustration")
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
    
    func setupCoverImageViewConstraints() {
        NSLayoutConstraint.activate([
            //            coverImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            coverImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            coverImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            coverImageView.bottomAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
    
    func setupLoginTextViewConstraints() {
        NSLayoutConstraint.activate([
            loginTextView.topAnchor.constraint(equalTo: coverImageView.bottomAnchor, constant: 130),
            loginTextView.widthAnchor.constraint(equalToConstant: 270),
            loginTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    func setupStartButton() {
        NSLayoutConstraint.activate([
            startButton.topAnchor.constraint(equalTo: loginTextView.bottomAnchor, constant: 38),
            startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            startButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -170)
        ])
    }
    
    func setupCoverLabelConstraints() {
        NSLayoutConstraint.activate([
            coverLabel.leadingAnchor.constraint(equalTo: coverImageView.leadingAnchor, constant: 80),
            coverLabel.trailingAnchor.constraint(equalTo: coverImageView.trailingAnchor, constant: -89),
            coverLabel.topAnchor.constraint(equalTo: coverImageView.topAnchor, constant: 10),
            //text.bottomAnchor.constraint(equalTo: firstView.bottomAnchor, constant: 40)
        ])
    }
    
    func setupCoverIconConstraints() {
        NSLayoutConstraint.activate([
            coverIcon.topAnchor.constraint(equalTo: coverLabel.bottomAnchor, constant: 10),
            coverIcon.leadingAnchor.constraint(equalTo: coverImageView.leadingAnchor, constant: 20),
            coverIcon.trailingAnchor.constraint(equalTo: coverImageView.trailingAnchor, constant: -20),
            coverIcon.bottomAnchor.constraint(equalTo: coverImageView.bottomAnchor, constant: -40)
        ])
    }
}
