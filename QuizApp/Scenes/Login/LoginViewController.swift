//
//  LoginViewController.swift
//  QuizApp
//
//  Created by Giorgi Makadze on 02.06.2023.
//

import UIKit

class LoginViewController: UIViewController {
    
    //MARK: - Components
    private let coverImageView: UIImageView = {
        let coverImageView = UIImageView()
        coverImageView.image = Constants.CoverImageView.image
        coverImageView.contentMode = .scaleAspectFill
        coverImageView.translatesAutoresizingMaskIntoConstraints = false
        return coverImageView
    }()
    
    private let loginTextView: UITextField = {
        let loginTextView = UITextField()
        loginTextView.backgroundColor = Constants.LoginTextView.backgroundColor
        loginTextView.font =  Constants.LoginTextView.font
        loginTextView.textColor = Constants.LoginTextView.textColor
        loginTextView.layer.borderColor = Constants.LoginTextView.borderColor
        loginTextView.layer.borderWidth = Constants.LoginTextView.borderWidth
        loginTextView.textAlignment = .center
        loginTextView.placeholder = Constants.LoginTextView.text
        loginTextView.layer.cornerRadius = Constants.LoginTextView.cornerRadius
        loginTextView.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: loginTextView.frame.height))
        loginTextView.leftViewMode = .always
        loginTextView.translatesAutoresizingMaskIntoConstraints = false
        return loginTextView
    }()
    
    private lazy var startButton: UIButton = {
        let startButton = UIButton(type: .custom)
        startButton.layer.cornerRadius = Constants.StartButton.cornerRadius
        startButton.setImage(Constants.StartButton.image, for: .normal)
        startButton.addTarget(self, action: #selector(startButtonTapped),  for: .touchUpInside)
        startButton.translatesAutoresizingMaskIntoConstraints = false
        return startButton
    }()
    
    private let coverLabel: UILabel = {
        let coverLabel = UILabel()
        coverLabel.text = Constants.CoverLabel.text
        coverLabel.backgroundColor = Constants.CoverLabel.backgroundColor
        coverLabel.font = Constants.CoverLabel.font
        coverLabel.textColor = Constants.CoverLabel.textColor
        coverLabel.textAlignment = .center
        coverLabel.translatesAutoresizingMaskIntoConstraints = false
        return coverLabel
    }()
    
    private let coverIcon: UIImageView = {
        let coverIcon = UIImageView()
        coverIcon.image = Constants.CoverIcon.image
        coverIcon.contentMode = .scaleAspectFit
        coverIcon.translatesAutoresizingMaskIntoConstraints = false
        return coverIcon
    }()
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Constants.View.backgroundColor
        loginTextView.delegate = self
        setupTapGestureRecognizer()
        registerKeyboardNotifications()
        setupCoverImageViewConstraints()
        setupLoginTextViewConstraints()
        setupStartButton()
        setupCoverLabelConstraints()
        setupCoverIconConstraints()
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    private func setupTapGestureRecognizer() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    private func registerKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func startButtonTapped() {
        let homeViewController = HomeViewController(with: HomeViewModel())
        let navVC = UINavigationController(rootViewController: homeViewController)
        window?.rootViewController = navVC
    }
    
    @objc private func keyboardWillShow(notification: NSNotification) {
        if let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect {
            let adjustedKeyboardFrame = view.convert(keyboardFrame, from: nil)
            let intersection = adjustedKeyboardFrame.intersection(view.frame)
            let keyboardHeight = intersection.height
            view.frame.origin.y -= keyboardHeight
        }
    }
    
    @objc private func keyboardWillHide(notification: NSNotification) {
        view.frame.origin.y = 0
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    // MARK: - Constraints Setup
    private func setupCoverImageViewConstraints() {
        view.addSubview(coverImageView)
        NSLayoutConstraint.activate([
            coverImageView.topAnchor.constraint(equalTo: view.topAnchor),
            coverImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            coverImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            coverImageView.heightAnchor.constraint(lessThanOrEqualToConstant: Constants.CoverImageView.heightAnchor)
        ])
    }
    
    private func setupLoginTextViewConstraints() {
        view.addSubview(loginTextView)
        NSLayoutConstraint.activate([
            loginTextView.topAnchor.constraint(equalTo: coverImageView.bottomAnchor, constant: Constants.LoginTextView.topAnchor),
            loginTextView.widthAnchor.constraint(equalToConstant: Constants.LoginTextView.widthAnchor),
            loginTextView.heightAnchor.constraint(equalToConstant: Constants.LoginTextView.heightAnchor),
            loginTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    private func setupStartButton() {
        view.addSubview(startButton)
        NSLayoutConstraint.activate([
            startButton.topAnchor.constraint(equalTo: loginTextView.bottomAnchor, constant: Constants.StartButton.topAnchor),
            startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
    private func setupCoverLabelConstraints() {
        view.addSubview(coverLabel)
        NSLayoutConstraint.activate([
            coverLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.CoverLabel.leadingAnchor),
            coverLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: Constants.CoverLabel.trailingAnchor),
            coverLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: Constants.CoverLabel.topAnchor),
        ])
    }
    
    private func setupCoverIconConstraints() {
        view.addSubview(coverIcon)
        NSLayoutConstraint.activate([
            coverIcon.topAnchor.constraint(equalTo: coverLabel.bottomAnchor, constant: Constants.CoverIcon.topAnchor),
            coverIcon.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.CoverIcon.leadingAnchor),
            coverIcon.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: Constants.CoverIcon.trailingAnchor),
            coverIcon.widthAnchor.constraint(equalToConstant: Constants.CoverIcon.widthAnchor),
            coverIcon.heightAnchor.constraint(equalToConstant: Constants.CoverIcon.heightAnchor)
        ])
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.textAlignment = .left
        textField.textColor = .black
        textField.placeholder = nil
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if textField.text?.isEmpty ?? true {
            textField.placeholder = Constants.LoginTextView.text
            textField.textAlignment = .center
        } else {
            textField.textAlignment = .left
        }
    }
}

// MARK: - Constants
private extension LoginViewController {
    enum Constants {
        
        enum CoverImageView {
            static let image = UIImage(named: "Blue")
            static let heightAnchor: CGFloat = 300
        }
        
        enum LoginTextView {
            static let contentInset: UIEdgeInsets = UIEdgeInsets(top: 5, left: 1.0, bottom: 5, right: 1.0)
            static let backgroundColor: UIColor = .clear
            static let font: UIFont = .systemFont(ofSize: 14)
            static let text = "შეიყვანე სახელი"
            static let textColor = UIColor(hex: "C7C7C7")
            static let borderColor = UIColor(hex: "FFC44A").cgColor
            static let borderWidth: CGFloat = 1.0
            static let cornerRadius: CGFloat = 12
            static let topAnchor: CGFloat = 200
            static let widthAnchor: CGFloat = 270
            static let heightAnchor: CGFloat = 44
        }
        
        enum StartButton {
            static let cornerRadius: CGFloat = 12
            static let image = UIImage(named: "StartButton")
            static let topAnchor: CGFloat = 40
            static let bottomAnchor: CGFloat = -70
        }
        
        enum CoverLabel {
            static let backgroundColor: UIColor = .clear
            static let textColor: UIColor = .white
            static let text = "ჩემი პირველი ქვიზი"
            static let font: UIFont =  .systemFont(ofSize: 20)
            static let leadingAnchor: CGFloat = 80
            static let trailingAnchor: CGFloat = -89
            static let topAnchor: CGFloat = 60
        }
        
        enum CoverIcon {
            static let image = UIImage(named: "Illustration")
            static let topAnchor: CGFloat = 2
            static let leadingAnchor: CGFloat = 20
            static let trailingAnchor: CGFloat = -20
            static let widthAnchor: CGFloat = 299
            static let heightAnchor: CGFloat = 299
        }
        
        enum View {
            static let backgroundColor: UIColor = .white
        }
    }
}
