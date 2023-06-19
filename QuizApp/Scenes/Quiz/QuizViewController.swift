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
    private lazy var subjectTableView: UITableView =  {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(AnswerCell.self, forCellReuseIdentifier: AnswerCell.reuseIdentifier)
        view.addSubview(tableView)
        return tableView
    }()
    
    private let questionBackground: UIImageView = {
        let questionBackground = UIImageView()
        questionBackground.image = Constants.QuestionBackground.image
        questionBackground.contentMode = .scaleToFill
        questionBackground.translatesAutoresizingMaskIntoConstraints = false
        return questionBackground
    }()
    
    private let questionLabel: UILabel = {
        var questionLabel = UILabel()
        questionLabel.textColor = Constants.QuestionLabel.textColor
        questionLabel.backgroundColor = Constants.QuestionLabel.backgroundColor
        questionLabel.numberOfLines = Constants.QuestionLabel.numberOfLines
        questionLabel.textAlignment = .center
        questionLabel.lineBreakMode = .byTruncatingTail
        questionLabel.font = .systemFont(ofSize: Constants.QuestionLabel.font)
        questionLabel.translatesAutoresizingMaskIntoConstraints = false
        return questionLabel
    }()
    
    private lazy var nextButton: UIButton = {
        let nextButton = UIButton()
        nextButton.setImage(Constants.NextButton.image, for: .normal)
        nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nextButton)
        return nextButton
    }()
    
    let question: Question = Question(
        text: "რომელია ყველაზე პოპულარული პროგრამირების ენა?",
        answers: [
            Answer(text: "Python", isCorrect: false),
            Answer(text: "Java", isCorrect: false),
            Answer(text: "C++", isCorrect: true),
            Answer(text: "Kotlin", isCorrect: false)
        ]
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        questionLabel.text = question.text
        setupNavigationController()
        setupQuestionBackgroundConstrains()
        setupTableViewConstraints()
        setupQuestionLabelConstraints()
        setupNextButtonConstraints()
    }
    
    // MARK: - Actions
    func setupNavigationController() {
        navigationItem.setHidesBackButton(true, animated: false)
        navigationItem.title = "პროგრამირება"
        let rightBarButtonItem = UIBarButtonItem(title: "X", style: .plain, target: self, action: #selector(rightBarButtonTapped))
        rightBarButtonItem.tintColor = .black
        navigationItem.rightBarButtonItem = rightBarButtonItem
    }
    
    @objc func nextButtonTapped() {
        let finishPopupViewController = FinishPopupController()
        finishPopupViewController.delegate = self
        finishPopupViewController.modalPresentationStyle = .overCurrentContext
        present(finishPopupViewController, animated: true, completion: nil)
    }
    
    @objc private func rightBarButtonTapped() {
        let popupViewController = PopupViewController()
        popupViewController.delegate = self
        popupViewController.modalPresentationStyle = .overCurrentContext
        present(popupViewController, animated: true, completion: nil)
    }
    
    // MARK: - Constraints Setup
    private func setupTableViewConstraints() {
        NSLayoutConstraint.activate([
            subjectTableView.topAnchor.constraint(equalTo: questionBackground.bottomAnchor, constant: Constants.TableView.topAnchor),
            subjectTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            subjectTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    private func setupNextButtonConstraints() {
        NSLayoutConstraint.activate([
            nextButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.NextButton.leadingAnchor),
            nextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: Constants.NextButton.trailingAnchor),
            nextButton.topAnchor.constraint(equalTo: subjectTableView.bottomAnchor, constant: Constants.NextButton.topAnchor),
            nextButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: Constants.NextButton.bottomAnchor)
        ])
    }
    
    private func setupQuestionBackgroundConstrains() {
        view.addSubview(questionBackground)
        NSLayoutConstraint.activate([
            questionBackground.topAnchor.constraint(equalTo: view.topAnchor),
            questionBackground.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            questionBackground.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            questionBackground.heightAnchor.constraint(lessThanOrEqualToConstant: Constants.QuestionBackground.heightAnchor)
        ])
    }
    
    private func setupQuestionLabelConstraints() {
        questionBackground.addSubview(questionLabel)
        NSLayoutConstraint.activate([
            questionLabel.topAnchor.constraint(equalTo: questionBackground.topAnchor, constant: Constants.QuestionLabel.topAnchor),
            questionLabel.leadingAnchor.constraint(equalTo: questionBackground.leadingAnchor, constant: Constants.QuestionLabel.leadingAnchor),
            questionLabel.trailingAnchor.constraint(equalTo: questionBackground.trailingAnchor, constant: Constants.QuestionLabel.trailingAnchor),
            questionLabel.bottomAnchor.constraint(equalTo: questionBackground.bottomAnchor, constant: Constants.QuestionLabel.bottomAnchor)
        ])
    }
}

// MARK: - PopupViewControllerDelegate
extension QuizViewController: PopupViewControllerDelegate {
    func didTapYesButton() {
        dismiss(animated: true, completion: nil)
        navigationController?.popViewController(animated: true)
    }
}

// MARK: - FinishPopupControllerDelegate
extension QuizViewController: FinishPopupControllerDelegate {
    func didTapCloseButton() {
        dismiss(animated: true, completion: nil)
        navigationController?.popViewController(animated: true)
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let isCorrect = question.answers[indexPath.row].isCorrect
        
        let cell = tableView.cellForRow(at: indexPath) as? AnswerCell
        cell?.setApperance(isCorrect: isCorrect)
        if !isCorrect {
            guard let correctIndex = question.answers.firstIndex(where: { $0.isCorrect }) else {
                return
            }
            let correctCell = tableView.cellForRow(at: IndexPath(row: correctIndex, section: 0)) as? AnswerCell
            correctCell?.setApperance(isCorrect: true)
        }
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
            static let topAnchor: CGFloat = 64
            static let leadingAnchor: CGFloat = 72
            static let trailingAnchor: CGFloat = -72
            static let widthAnchor: CGFloat = 200
            static let bottomAnchor: CGFloat = -8
        }
        
        enum NextButton {
            static let image = UIImage(named: "Next")
            static let topAnchor: CGFloat = 32
            static let leadingAnchor: CGFloat = 16
            static let trailingAnchor: CGFloat = -16
            static let bottomAnchor: CGFloat = -50
        }
        
        enum TableView {
            static let topAnchor: CGFloat = 30
        }
        
        enum TableViewCell {
            static let cellHeight: CGFloat = 60
            static let distanceBetweenCells: CGFloat = 12
        }
    }
}
