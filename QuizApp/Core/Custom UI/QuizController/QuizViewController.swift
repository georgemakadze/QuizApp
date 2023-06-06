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
        questionBackground.image = UIImage(named: "Rectangle")
        questionBackground.contentMode = .scaleAspectFill
        questionBackground.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(questionBackground)
        return questionBackground
    }()
    
    private lazy var questionLabel: UILabel = {
        let questionLabel = UILabel()
        questionLabel.text = "რომელია ყველაზე პოპულარული პროგრამირების ენა?"
        questionLabel.textColor = .black
        questionLabel.backgroundColor = .clear
        questionLabel.numberOfLines = 3
        questionLabel.lineBreakMode = .byTruncatingTail
        questionLabel.font = .systemFont(ofSize: 16)
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
    
    let answers: [QuestionItem] = [
        QuestionItem(answer: "Python"),
        QuestionItem(answer: "Java"),
        QuestionItem(answer: "C++"),
        QuestionItem(answer: "Kotlin")
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
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(QuestionCell.self, forCellReuseIdentifier: "QuestionCell")
        view.addSubview(tableView)
    }
    
    func tableViewConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: questionBackground.bottomAnchor, constant: 74),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    func nextButtonConstraints() {
        NSLayoutConstraint.activate([
            nextButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            nextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            nextButton.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 64),
            nextButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -160)
        ])
    }
    
    func questionBackgroundConstrains() {
        NSLayoutConstraint.activate([
            questionBackground.topAnchor.constraint(equalTo: view.topAnchor),
            questionBackground.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            questionBackground.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            //            questionBackground.widthAnchor.constraint(equalToConstant: 376),
            //            questionBackground.heightAnchor.constraint(equalToConstant: 218)
            //            questionBackground.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -580)
        ])
    }
    
    func questionLabelConstraints() {
        NSLayoutConstraint.activate([
            questionLabel.centerXAnchor.constraint(equalTo: questionBackground.centerXAnchor),
            questionLabel.topAnchor.constraint(equalTo: questionBackground.topAnchor, constant: 120),
            questionLabel.leadingAnchor.constraint(equalTo: questionBackground.leadingAnchor, constant: 72),
            questionLabel.trailingAnchor.constraint(equalTo: questionBackground.trailingAnchor, constant: -72),
            questionLabel.widthAnchor.constraint(lessThanOrEqualToConstant: 200) //
        ])
    }
}

extension QuizViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return answers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "QuestionCell", for: indexPath) as! QuestionCell
        let question = answers[indexPath.row]
        cell.configure(with: question)
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
