//
//  QuizController.swift
//  QuizApp
//
//  Created by Giorgi Makadze on 06.06.2023.
//

import Foundation
import UIKit

class QuizViewController: UIViewController {
    private var tableView: UITableView!
    
    private lazy var questionBackground: UIImageView = {
        let questionBackground = UIImageView()
        questionBackground.image = Constants.QuestionBackground.image
        questionBackground.contentMode = .scaleAspectFill
        questionBackground.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(questionBackground)
        return questionBackground
    }()
    
    private lazy var questionLabel: UILabel = {
        var questionLabel = UILabel()
        questionLabel.textColor = .black
        questionLabel.backgroundColor = .clear
        questionLabel.numberOfLines = Constants.QuestionLabel.numberOfLines
        questionLabel.lineBreakMode = .byTruncatingTail
        questionLabel.font = .systemFont(ofSize: Constants.QuestionLabel.font)
        questionLabel.translatesAutoresizingMaskIntoConstraints = false
        questionBackground.addSubview(questionLabel)
        return questionLabel
    }()
    
    private lazy var nextButton: UIButton = {
        let nextButton = UIButton()
        nextButton.setImage(UIImage(named: "Next"), for: .normal)
        // daklikeba
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nextButton)
        return nextButton
    }()
    
    let question: [QuestionItem] = [
        QuestionItem(answer: "Python", text: "რომელია ყველაზე პოპულარული პროგრამირების ენა?"),
        QuestionItem(answer: "Java", text: "რომელია ყველაზე პოპულარული პროგრამირების ენა?"),
        QuestionItem(answer: "C++", text: "რომელია ყველაზე პოპულარული პროგრამირების ენა?"),
        QuestionItem(answer: "Kotlin", text: "რომელია ყველაზე პოპულარული პროგრამირების ენა?")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        questionBackgroundConstrains()
        setupTableView()
        tableViewConstraints()
        questionLabelConstraints()
        nextButtonConstraints()
    }
    
    func setupTableView() {
        tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(AnswerCell.self, forCellReuseIdentifier: AnswerCell.reuseIdentifier)
        view.addSubview(tableView)
    }
    
    private func tableViewConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: questionBackground.bottomAnchor, constant: 74),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    private func nextButtonConstraints() {
        NSLayoutConstraint.activate([
            nextButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            nextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            nextButton.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 64),
            nextButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -160)
        ])
    }
    
    private func questionBackgroundConstrains() {
        NSLayoutConstraint.activate([
            questionBackground.topAnchor.constraint(equalTo: view.topAnchor),
            questionBackground.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            questionBackground.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            //            questionBackground.widthAnchor.constraint(equalToConstant: 376),
            //            questionBackground.heightAnchor.constraint(equalToConstant: 218)
            //            questionBackground.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -580)
        ])
    }
    
    private func questionLabelConstraints() {
        NSLayoutConstraint.activate([
            questionLabel.centerXAnchor.constraint(equalTo: questionBackground.centerXAnchor),
            questionLabel.topAnchor.constraint(equalTo: questionBackground.topAnchor, constant: Constants.QuestionLabel.topAnchor),
            questionLabel.leadingAnchor.constraint(equalTo: questionBackground.leadingAnchor, constant: Constants.QuestionLabel.leadingAnchor),
            questionLabel.trailingAnchor.constraint(equalTo: questionBackground.trailingAnchor, constant: Constants.QuestionLabel.trailingAnchor),
            questionLabel.widthAnchor.constraint(lessThanOrEqualToConstant: Constants.QuestionLabel.widthAnchor)
        ])
    }
}

extension QuizViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return question.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AnswerCell.reuseIdentifier, for: indexPath) as! AnswerCell
        //        let question = question[indexPath.row]
        //        cell.configure(with: question.answer)
        let currentQuestion = question[indexPath.row]
        cell.configure(with: currentQuestion.answer)
        questionLabel.text = currentQuestion.text
        return cell
    }
}

extension QuizViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let cellHeight: CGFloat = 60
        let distanceBetweenCells: CGFloat = 12
        let totalHeight = cellHeight + distanceBetweenCells
        
        return totalHeight
    }
}

extension QuizViewController {
    enum Constants {
        enum QuestionBackground {
            static let image = UIImage(named: "Rectangle")
        }
        enum QuestionLabel {
            static let numberOfLines = 3
            static let font: CGFloat = 16
            static let topAnchor: CGFloat = 120
            static let leadingAnchor: CGFloat = 72
            static let trailingAnchor: CGFloat = -72
            static let widthAnchor: CGFloat = 200
        }
    }
}
