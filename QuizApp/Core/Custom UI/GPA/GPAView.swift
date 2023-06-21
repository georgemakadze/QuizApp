//
//  GPAView.swift
//  QuizApp
//
//  Created by Giorgi Makadze on 21.06.2023.
//

import Foundation
import UIKit

class GPAView: UIView {
    
    //MARK: - Components
    private lazy var scoreHeaderView: UIView = {
        let scoreHeaderView = UIView()
        scoreHeaderView.backgroundColor = Constants.ScoreHeaderView.backgroundColor
        scoreHeaderView.layer.cornerRadius = Constants.ScoreHeaderView.cornerRadius
        return scoreHeaderView
    }()
    
    private let gpaView: UIView = {
        let gpaView = UIView()
        gpaView.backgroundColor = Constants.GpaView.backgroundColor
        gpaView.layer.cornerRadius = Constants.GpaView.cornerRadius
        gpaView.translatesAutoresizingMaskIntoConstraints = false
        return gpaView
    }()
    
    private let gpaTextLabel: UILabel = {
        let gpaTextLabel = UILabel()
        gpaTextLabel.text = Constants.GpaTextLabel.text
        gpaTextLabel.font = Constants.GpaTextLabel.font
        gpaTextLabel.backgroundColor = Constants.GpaTextLabel.backgroundColor
        gpaTextLabel.textColor = Constants.GpaTextLabel.textColor
        gpaTextLabel.translatesAutoresizingMaskIntoConstraints = false
        return gpaTextLabel
    }()
    
    private let gpaScoreLabel: UILabel = {
        var gpaScoreLabel = UILabel()
        gpaScoreLabel.text = Constants.GpaScoreLabel.text
        gpaScoreLabel.font = Constants.GpaScoreLabel.font
        gpaScoreLabel.backgroundColor = Constants.GpaScoreLabel.backgroundColor
        gpaScoreLabel.textColor = Constants.GpaScoreLabel.textColor
        gpaScoreLabel.translatesAutoresizingMaskIntoConstraints = false
        return gpaScoreLabel
    }()
    
    private let scoreViewDetailLabel: UILabel = {
        let scoreViewDetailLabel = UILabel()
        scoreViewDetailLabel.text = Constants.ScoreViewDetailLabel.text
        scoreViewDetailLabel.font = Constants.ScoreViewDetailLabel.font
        scoreViewDetailLabel.textColor = Constants.ScoreViewDetailLabel.textColor
        scoreViewDetailLabel.backgroundColor = Constants.ScoreViewDetailLabel.backgroundColor
        scoreViewDetailLabel.translatesAutoresizingMaskIntoConstraints = false
        return scoreViewDetailLabel
    }()
    
    private let scoreViewDetailImageView: UIImageView = {
        let scoreViewDetailImageView = UIImageView()
        scoreViewDetailImageView.image = Constants.ScoreViewDetailButton.image
        scoreViewDetailImageView.translatesAutoresizingMaskIntoConstraints = false
        return scoreViewDetailImageView
    }()
    
    init() {
            super.init(frame: .zero)
            setupView()
        }
    
    required init?(coder: NSCoder) {
        fatalError("error!")
    }
    
    func setupView() {
        setupScoreHeaderViewConstraints()
        setupGpaViewConstrains()
        setupGpaTextLabelConstraints()
        setupGpaScoreLabelConstraints()
        setupScoreViewDetailLabelConstraints()
        setupScoreViewDetailImageViewConstraints()
    }

    // MARK: - Constraints Setup
    private func setupScoreHeaderViewConstraints() {
        self.addSubview(scoreHeaderView)
        scoreHeaderView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scoreHeaderView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            scoreHeaderView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            scoreHeaderView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            scoreHeaderView.widthAnchor.constraint(equalToConstant: Constants.ScoreHeaderView.widthAnchor),
            scoreHeaderView.heightAnchor.constraint(equalToConstant: Constants.ScoreHeaderView.heightAnchor)
        ])
    }
    
    private func setupGpaViewConstrains() {
        scoreHeaderView.addSubview(gpaView)
        NSLayoutConstraint.activate([
            gpaView.topAnchor.constraint(equalTo: scoreHeaderView.topAnchor, constant: Constants.GpaView.topAnchor),
            gpaView.bottomAnchor.constraint(equalTo: scoreHeaderView.bottomAnchor, constant: Constants.GpaView.bottomAnchor),
            gpaView.leadingAnchor.constraint(equalTo: scoreHeaderView.leadingAnchor, constant: Constants.GpaView.leadingAnchor),
            gpaView.widthAnchor.constraint(equalToConstant: Constants.GpaView.widthAnchor),
            gpaView.heightAnchor.constraint(equalToConstant: Constants.GpaView.heightAnchor)
        ])
    }
    
    private func setupGpaTextLabelConstraints() {
        gpaView.addSubview(gpaTextLabel)
        NSLayoutConstraint.activate([
            gpaTextLabel.topAnchor.constraint(equalTo: gpaView.topAnchor, constant: Constants.GpaTextLabel.topAnchor),
            gpaTextLabel.bottomAnchor.constraint(equalTo: gpaView.bottomAnchor, constant: Constants.GpaTextLabel.bottomAnchor),
            gpaTextLabel.leadingAnchor.constraint(equalTo: gpaView.leadingAnchor, constant: Constants.GpaTextLabel.leadingAnchor),
        ])
    }
    
    private func setupGpaScoreLabelConstraints(){
        gpaView.addSubview(gpaScoreLabel)
        NSLayoutConstraint.activate([
            gpaScoreLabel.topAnchor.constraint(equalTo: gpaView.topAnchor, constant: Constants.GpaScoreLabel.topAnchor),
            gpaScoreLabel.bottomAnchor.constraint(equalTo: gpaView.bottomAnchor, constant: Constants.GpaScoreLabel.bottomAnchor),
            gpaScoreLabel.trailingAnchor.constraint(equalTo: gpaView.trailingAnchor, constant: Constants.GpaScoreLabel.trailingAnchor),
            gpaScoreLabel.leadingAnchor.constraint(equalTo: gpaTextLabel.trailingAnchor,constant: Constants.GpaScoreLabel.leadingAnchor)
        ])
    }
    
    private func setupScoreViewDetailLabelConstraints() {
        scoreHeaderView.addSubview(scoreViewDetailLabel)
        NSLayoutConstraint.activate([
            scoreViewDetailLabel.topAnchor.constraint(equalTo: scoreHeaderView.topAnchor, constant: Constants.ScoreViewDetailLabel.topAnchor),
            scoreViewDetailLabel.bottomAnchor.constraint(equalTo: scoreHeaderView.bottomAnchor, constant: Constants.ScoreViewDetailLabel.bottomAnchor)
        ])
    }
    
    private func  setupScoreViewDetailImageViewConstraints() {
        scoreHeaderView.addSubview(scoreViewDetailImageView)
        NSLayoutConstraint.activate([
            scoreViewDetailImageView.topAnchor.constraint(equalTo: scoreHeaderView.topAnchor, constant: Constants.ScoreViewDetailButton.topAnchor),
            scoreViewDetailImageView.bottomAnchor.constraint(equalTo: scoreHeaderView.bottomAnchor, constant: Constants.ScoreViewDetailButton.bottomAnchor),
            scoreViewDetailImageView.trailingAnchor.constraint(equalTo: scoreHeaderView.trailingAnchor, constant: Constants.ScoreViewDetailButton.trailingAnchor),
            scoreViewDetailImageView.leadingAnchor.constraint(equalTo: scoreViewDetailLabel.trailingAnchor, constant: Constants.ScoreViewDetailButton.leadingAnchor)
        ])
    }
    
}

// MARK: - Constants
private extension GPAView {
    enum Constants {
        
        enum ScoreHeaderView {
            static let backgroundColor = UIColor(hex: "537FE7")
            static let cornerRadius: CGFloat = 26
            static let topAnchor: CGFloat = 20
            static let leadingAnchor: CGFloat = 16
            static let trailingAnchor: CGFloat = -16
            static let widthAnchor: CGFloat = 344
            static let heightAnchor: CGFloat = 76
        }
        
        enum GpaView {
            static let backgroundColor = UIColor(hex: "6B91EA")
            static let cornerRadius: CGFloat = 14
            static let topAnchor: CGFloat = 16
            static let bottomAnchor: CGFloat = -16
            static let leadingAnchor: CGFloat = 18
            static let widthAnchor: CGFloat = 88
            static let heightAnchor: CGFloat = 40
        }
        
        enum GpaTextLabel {
            static let text = "GPA -"
            static let backgroundColor: UIColor = .clear
            static let textColor: UIColor = .white
            static let font: UIFont = .systemFont(ofSize: 16)
            static let topAnchor: CGFloat = 6
            static let bottomAnchor: CGFloat = -6
            static let leadingAnchor: CGFloat = 10
        }
        
        enum GpaScoreLabel {
            static let textColor = UIColor(hex: "FFD24C")
            static let font: UIFont = .systemFont(ofSize: 16)
            static let text = "1.0"
            static let backgroundColor: UIColor = .clear
            static let trailingAnchor: CGFloat = -10
            static let topAnchor: CGFloat = 6
            static let bottomAnchor: CGFloat = -6
            static let leadingAnchor: CGFloat = 2
        }
        
        enum ScoreViewDetailLabel {
            static let textColor: UIColor = .white
            static let text = "დეტალურად"
            static let backgroundColor: UIColor = .clear
            static let font: UIFont = .systemFont(ofSize: 16)
            static let topAnchor: CGFloat = 28
            static let bottomAnchor: CGFloat = -29
        }
        
        enum ScoreViewDetailButton {
            static let image = UIImage(named: "Polygon")
            static let topAnchor: CGFloat = 30
            static let leadingAnchor: CGFloat = 4
            static let trailingAnchor: CGFloat = -34
            static let bottomAnchor: CGFloat = -31
        }
    }
}
