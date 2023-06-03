//
//  LoginViewController.swift
//  QuizApp
//
//  Created by Giorgi Makadze on 02.06.2023.
//

import UIKit

class LoginViewController: UIViewController {
    
    private lazy var firstView: UIImageView = {
        let firstView = UIImageView()
        firstView.image = UIImage(named: "Blue")
        firstView.contentMode = .scaleAspectFill
        view.addSubview(firstView)
        firstView.translatesAutoresizingMaskIntoConstraints = false
        
        return firstView
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
    
    private lazy var text: UITextView = {
        let text = UITextView()
        text.text = "ჩემი პირველი ქვიზი"
        text.backgroundColor = .clear
        text.font = .systemFont(ofSize: 20)
        text.textColor = .white
        text.textAlignment = .center
        text.translatesAutoresizingMaskIntoConstraints = false
        firstView.addSubview(text)
        return text
    }()
    
    private lazy var firstViewImage: UIImageView = {
        let firstViewImage = UIImageView()
        firstViewImage.image = UIImage(named: "Illustration")
        firstViewImage.contentMode = .scaleAspectFill
        firstViewImage.translatesAutoresizingMaskIntoConstraints = false
        firstView.addSubview(firstViewImage)
        return firstViewImage
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupFirstViewConstraints()
        setupLoginTextViewConstraints()
        setupStartButton()
        textConstraints()
        firstViewImageConstraints()
    }
    
    @objc func startButtonTapped() {
        UIView.animate(withDuration: 0.3, animations: {
            self.startButton.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        }, completion: { _ in
            UIView.animate(withDuration: 0.3) {
                self.startButton.transform = CGAffineTransform.identity
            }
        })
    }
    
    func setupFirstViewConstraints() {
        NSLayoutConstraint.activate([
            firstView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 44),
            firstView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            firstView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            firstView.bottomAnchor.constraint(equalTo: view.centerYAnchor),
            //            firstView.widthAnchor.constraint(equalToConstant: 600),
            //            firstView.heightAnchor.constraint(equalToConstant: 600)
        ])
    }
    
    func setupLoginTextViewConstraints() {
        NSLayoutConstraint.activate([
            loginTextView.topAnchor.constraint(equalTo: firstView.bottomAnchor, constant: 130),
            //            loginTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            //            loginTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            loginTextView.widthAnchor.constraint(equalToConstant: 270),
            loginTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            //            loginTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -270)
        ])
    }
    
    func setupStartButton() {
        NSLayoutConstraint.activate([
            startButton.topAnchor.constraint(equalTo: loginTextView.bottomAnchor, constant: 38),
            //            startButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60),
            //            startButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -60),
            startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            startButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -170)
        ])
    }
    
    func textConstraints() {
        NSLayoutConstraint.activate([
            text.leadingAnchor.constraint(equalTo: firstView.leadingAnchor, constant: 20),
            text.trailingAnchor.constraint(equalTo: firstView.trailingAnchor, constant: -20),
            text.topAnchor.constraint(equalTo: firstView.topAnchor, constant: 20),
            //text.bottomAnchor.constraint(equalTo: firstView.bottomAnchor, constant: 40)
        ])
    }
    
    func firstViewImageConstraints() {
        NSLayoutConstraint.activate([
            firstViewImage.topAnchor.constraint(equalTo: text.bottomAnchor, constant: 20),
            firstViewImage.leadingAnchor.constraint(equalTo: firstView.leadingAnchor, constant: 20),
            firstViewImage.trailingAnchor.constraint(equalTo: firstView.trailingAnchor, constant: -20),
            firstViewImage.bottomAnchor.constraint(equalTo: firstView.bottomAnchor, constant: 16)
        ])
    }
}
