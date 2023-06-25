//
//  QuizProgressView.swift
//  QuizApp
//
//  Created by Giorgi Makadze on 22.06.2023.
//

import Foundation
import UIKit

class QuizProgressView: UIView {
    
    //MARK: - Components
    private let container: UIView = {
        let container = UIView()
        container.backgroundColor = Constants.Container.backgroundColor
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    
    let progressView: UIProgressView = {
        let progressView = UIProgressView()
        progressView.contentMode = .scaleToFill
        progressView.tintColor = Constants.ProgressView.tintColor
        progressView.progress = Float(Constants.ProgressView.progress)
        progressView.layer.cornerRadius = Constants.ProgressView.cornerRadius
        progressView.translatesAutoresizingMaskIntoConstraints = false
        return progressView
    }()
    
    let scoreLabel: UILabel = {
        let scoreLabel = UILabel()
        scoreLabel.textColor = .black
        scoreLabel.font = Constants.ScoreLabel.font
        scoreLabel.translatesAutoresizingMaskIntoConstraints = false
        return scoreLabel
    }()
    
    let currentScoreLabel: UILabel = {
        let currentScoreLabel = UILabel()
        currentScoreLabel.text = Constants.CurrentScoreLabel.text
        currentScoreLabel.textColor = Constants.CurrentScoreLabel.textColor
        currentScoreLabel.font = Constants.CurrentScoreLabel.font
        currentScoreLabel.translatesAutoresizingMaskIntoConstraints = false
        return currentScoreLabel
    }()
    
    init() {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("error!")
    }
    
    func setupView() {
        setupContainerConstraints()
        setupProgressViewConstraints()
        setupScoreLabelConstraints()
        setupCurrentScoreLabelConstraints()
    }
    
    // MARK: - Constraints Setup
    private func setupContainerConstraints() {
        self.addSubview(container)
        NSLayoutConstraint.activate([
            container.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            container.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Constants.Container.leadingAnchor),
            container.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: Constants.Container.trailingAnchor),
            container.widthAnchor.constraint(equalToConstant: Constants.Container.widthAnchor),
            container.heightAnchor.constraint(equalToConstant: Constants.Container.heightAnchor)
        ])
    }
    
    private func setupProgressViewConstraints() {
        container.addSubview(progressView)
        NSLayoutConstraint.activate([
            progressView.leadingAnchor.constraint(equalTo: container.leadingAnchor),
            progressView.trailingAnchor.constraint(equalTo: container.trailingAnchor),
            progressView.bottomAnchor.constraint(equalTo: container.bottomAnchor),
            progressView.heightAnchor.constraint(equalToConstant: Constants.ProgressView.heightAnchor)
        ])
    }
    
    private func setupScoreLabelConstraints() {
        container.addSubview(scoreLabel)
        NSLayoutConstraint.activate([
            scoreLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor),
            scoreLabel.topAnchor.constraint(equalTo: container.topAnchor, constant: Constants.ScoreLabel.topAnchor),
            scoreLabel.bottomAnchor.constraint(equalTo: progressView.topAnchor, constant: Constants.ScoreLabel.bottomAnchor)
        ])
    }
    
    private func setupCurrentScoreLabelConstraints() {
        container.addSubview(currentScoreLabel)
        NSLayoutConstraint.activate([
            currentScoreLabel.trailingAnchor.constraint(equalTo: container.trailingAnchor),
            currentScoreLabel.topAnchor.constraint(equalTo: container.topAnchor, constant: Constants.CurrentScoreLabel.topAnchor),
            currentScoreLabel.bottomAnchor.constraint(equalTo: progressView.topAnchor, constant: Constants.CurrentScoreLabel.bottomAnchor)
        ])
    }
}

extension QuizProgressView {
    enum Constants {
        
        enum Container {
            static let backgroundColor: UIColor = .clear
            static let leadingAnchor: CGFloat = 20
            static let trailingAnchor: CGFloat = -20
            static let widthAnchor: CGFloat = 344
            static let heightAnchor: CGFloat = 36
        }
        
        enum ProgressView {
            static let tintColor: UIColor = UIColor(hex: "537FE7")
            static let progress = 0.0
            static let cornerRadius: CGFloat = 20
            static let heightAnchor: CGFloat = 9
        }
        
        enum ScoreLabel {
            static let font: UIFont = UIFont.boldSystemFont(ofSize: 16)
            static let topAnchor: CGFloat = 2
            static let bottomAnchor: CGFloat = -4
        }
        
        enum CurrentScoreLabel {
            static let text = "მიმდინარე ქულა -0 ⭐️"
            static let textColor: UIColor = UIColor(hex: "FFC44A")
            static let font: UIFont = .systemFont(ofSize: 16)
            static let topAnchor: CGFloat = 2
            static let bottomAnchor: CGFloat = -4
        }
    }
}
