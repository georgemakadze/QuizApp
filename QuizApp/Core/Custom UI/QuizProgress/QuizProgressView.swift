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
        container.backgroundColor = .clear
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    
     let progressView: UIProgressView = {
        let progressView = UIProgressView()
        progressView.contentMode = .scaleToFill
        progressView.tintColor = UIColor(hex: "537FE7")
         progressView.progress = 0.0
        progressView.layer.cornerRadius = 20
        progressView.translatesAutoresizingMaskIntoConstraints = false
        return progressView
    }()
    
     let scoreLabel: UILabel = {
        let scoreLabel = UILabel()
        scoreLabel.textColor = .black
        scoreLabel.font = UIFont.boldSystemFont(ofSize: 16)
        scoreLabel.translatesAutoresizingMaskIntoConstraints = false
        return scoreLabel
    }()
    
     let currentScoreLabel: UILabel = {
        let currentScoreLabel = UILabel()
        currentScoreLabel.text = "მიმდინარე ქულა -0 ⭐️"
        currentScoreLabel.textColor = UIColor(hex: "FFC44A")
        currentScoreLabel.font = .systemFont(ofSize: 16)
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
            container.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            container.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            container.widthAnchor.constraint(equalToConstant: 344),
            container.heightAnchor.constraint(equalToConstant: 36)
        ])
    }
    
    private func setupProgressViewConstraints() {
        container.addSubview(progressView)
        NSLayoutConstraint.activate([
            progressView.leadingAnchor.constraint(equalTo: container.leadingAnchor),
            progressView.trailingAnchor.constraint(equalTo: container.trailingAnchor),
            progressView.bottomAnchor.constraint(equalTo: container.bottomAnchor),
            progressView.heightAnchor.constraint(equalToConstant: 9)
        ])
    }
    
    private func setupScoreLabelConstraints() {
        container.addSubview(scoreLabel)
        NSLayoutConstraint.activate([
            scoreLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor),
            scoreLabel.topAnchor.constraint(equalTo: container.topAnchor, constant: 2),
            scoreLabel.bottomAnchor.constraint(equalTo: progressView.topAnchor, constant: -4)
        ])
    }
    
    private func setupCurrentScoreLabelConstraints() {
        container.addSubview(currentScoreLabel)
        NSLayoutConstraint.activate([
            currentScoreLabel.trailingAnchor.constraint(equalTo: container.trailingAnchor),
            currentScoreLabel.topAnchor.constraint(equalTo: container.topAnchor, constant: 2),
            currentScoreLabel.bottomAnchor.constraint(equalTo: progressView.topAnchor, constant: -4)
        ])
    }
}
