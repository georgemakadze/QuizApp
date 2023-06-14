//
//  QuizController.swift
//  QuizApp
//
//  Created by Giorgi Makadze on 06.06.2023.
//

import Foundation
import UIKit

class QuizViewController: UIViewController {
    
    //MARK: - Components
    
    private var tableView: UITableView!
    private lazy var questionBackground: UIImageView = {
        let questionBackground = UIImageView()
        questionBackground.image = Constants.QuestionBackground.image
        questionBackground.contentMode = .scaleToFill
        questionBackground.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(questionBackground)
        return questionBackground
    }()
    
    private lazy var questionLabel: UILabel = {
        var questionLabel = UILabel()
        questionLabel.textColor = Constants.QuestionLabel.textColor
        questionLabel.backgroundColor = Constants.QuestionLabel.backgroundColor
        questionLabel.numberOfLines = Constants.QuestionLabel.numberOfLines
        questionLabel.textAlignment = .center
        questionLabel.lineBreakMode = .byTruncatingTail
        questionLabel.font = .systemFont(ofSize: Constants.QuestionLabel.font)
        questionLabel.translatesAutoresizingMaskIntoConstraints = false
        questionBackground.addSubview(questionLabel)
        return questionLabel
    }()
    
    private lazy var nextButton: UIButton = {
        let nextButton = UIButton()
        nextButton.setImage(Constants.NextButton.image, for: .normal)
        // daklikeba
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nextButton)
        return nextButton
    }()
    
    let question: Question = Question(
        text: "რომელია ყველაზე პოპულარული პროგრამირების ენა?",
        answers: [
            "Python",
            "Java",
            "C++",
            "Kotlin"
        ]
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupQuestionBackgroundConstrains()
        setupTableView()
        setupTableViewConstraints()
        setupQuestionLabelConstraints()
        setupNextButtonConstraints()
    }
    
    private func setupTableView() {
        tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(AnswerCell.self, forCellReuseIdentifier: AnswerCell.reuseIdentifier)
        view.addSubview(tableView)
    }
    
    // MARK: - Constraints Setup
    
    private func setupTableViewConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: questionBackground.bottomAnchor, constant: Constants.TableView.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    private func setupNextButtonConstraints() {
        NSLayoutConstraint.activate([
            nextButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.NextButton.leadingAnchor),
            nextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: Constants.NextButton.trailingAnchor),
            nextButton.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: Constants.NextButton.topAnchor),
            nextButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: Constants.NextButton.bottomAnchor)
        ])
    }
    
    private func setupQuestionBackgroundConstrains() {
        NSLayoutConstraint.activate([
            questionBackground.topAnchor.constraint(equalTo: view.topAnchor),
            questionBackground.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            questionBackground.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            questionBackground.heightAnchor.constraint(lessThanOrEqualToConstant: Constants.QuestionBackground.heightAnchor)
        ])
    }
    
    private func setupQuestionLabelConstraints() {
        NSLayoutConstraint.activate([
            questionLabel.topAnchor.constraint(equalTo: questionBackground.topAnchor, constant: Constants.QuestionLabel.topAnchor),
            questionLabel.leadingAnchor.constraint(equalTo: questionBackground.leadingAnchor, constant: Constants.QuestionLabel.leadingAnchor),
            questionLabel.trailingAnchor.constraint(equalTo: questionBackground.trailingAnchor, constant: Constants.QuestionLabel.trailingAnchor),
            questionLabel.bottomAnchor.constraint(equalTo: questionBackground.bottomAnchor, constant: Constants.QuestionLabel.bottomAnchor)
        ])
    }
}

// MARK: - UITableViewDataSource

extension QuizViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        question.answers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AnswerCell.reuseIdentifier, for: indexPath) as! AnswerCell
        let currentAnswer = question.answers[indexPath.row]
        cell.configure(with: currentAnswer)
        questionLabel.text = question.text
        return cell
    }
}

// MARK: - UITableViewDelegate

extension QuizViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let cellHeight = Constants.TableViewCell.cellHeight
        let distanceBetweenCells = Constants.TableViewCell.distanceBetweenCells
        let totalHeight = cellHeight + distanceBetweenCells
        return totalHeight
    }
}

// MARK: - Constants

private extension QuizViewController {
    enum Constants {
        
        enum QuestionBackground {
            static let image = UIImage(named: "Rectangle")
            static let heightAnchor: CGFloat = 250
        }
        
        enum QuestionLabel {
            static let textColor: UIColor = .black
            static let backgroundColor: UIColor = .clear
            static let numberOfLines = 3
            static let font: CGFloat = 16
            static let topAnchor: CGFloat = 48
            static let leadingAnchor: CGFloat = 72
            static let trailingAnchor: CGFloat = -72
            static let widthAnchor: CGFloat = 200
            static let bottomAnchor: CGFloat = -8
        }
        
        enum NextButton {
            static let image = UIImage(named: "Next")
            static let topAnchor: CGFloat = 64
            static let leadingAnchor: CGFloat = 16
            static let trailingAnchor: CGFloat = -16
            static let bottomAnchor: CGFloat = -64
        }
        
        enum TableView {
            static let topAnchor: CGFloat = 74
        }
        
        enum TableViewCell {
            static let cellHeight: CGFloat = 60
            static let distanceBetweenCells: CGFloat = 12
        }
    }
}
