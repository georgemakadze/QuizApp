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
    private let quizViewModel: QuizViewModel
    
    private let quizProgressView: QuizProgressView = {
        let quizProgressView = QuizProgressView()
        quizProgressView.translatesAutoresizingMaskIntoConstraints = false
        return quizProgressView
    }()
    
    
    private lazy var subjectTableView: UITableView =  {
        let subjectTableView = UITableView()
        subjectTableView.separatorStyle = .none
        subjectTableView.delegate = self
        subjectTableView.dataSource = self
        subjectTableView.register(AnswerCell.self, forCellReuseIdentifier: AnswerCell.reuseIdentifier)
        return subjectTableView
    }()
    
    private let questionBackground: UIView = {
        let questionBackground = UIView()
        questionBackground.backgroundColor = Constants.QuestionBackground.backgroundColor
        questionBackground.layer.cornerRadius = Constants.QuestionBackground.cornerRadius
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
        return nextButton
    }()
    
    init(with viewModel: QuizViewModel) {
        quizViewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        questionLabel.text = quizViewModel.questions[quizViewModel.currentQuestionIndex].text
        setupNavigationController()
        setupQuestionBackgroundConstrains()
        setupTableViewConstraints()
        setupQuestionLabelConstraints()
        setupNextButtonConstraints()
        setupQuizProgressViewConstraints()
        loadQuestion()
    }
    
    // MARK: - Actions
    func setupNavigationController() {
        navigationItem.setHidesBackButton(true, animated: false)
        navigationItem.title = "პროგრამირება"
        let rightBarButtonItem = UIBarButtonItem(title: "X", style: .plain, target: self, action: #selector(rightBarButtonTapped))
        rightBarButtonItem.tintColor = .black
        navigationItem.rightBarButtonItem = rightBarButtonItem
    }
    
    func loadQuestion() {
        guard quizViewModel.currentQuestionIndex >= 0 && quizViewModel.currentQuestionIndex < quizViewModel.questions.count else {
            return
        }
        
        let question = quizViewModel.questions[quizViewModel.currentQuestionIndex]
        questionLabel.text = question.text
        quizProgressView.scoreLabel.text = "\(quizViewModel.currentQuestionIndex + 1)/\(quizViewModel.questions.count)"
        
        let progress = Float((quizViewModel.currentQuestionIndex + 1)) / Float(quizViewModel.questions.count)
        quizProgressView.progressView.setProgress(progress, animated: true)
        subjectTableView.reloadData()
    }
    
    @objc func nextButtonTapped() {
        quizViewModel.currentQuestionIndex += 1
        
        if quizViewModel.currentQuestionIndex == quizViewModel.questions.count {
            let finishPopupViewController = FinishPopupController()
            finishPopupViewController.delegate = self
            finishPopupViewController.modalPresentationStyle = .overCurrentContext
            present(finishPopupViewController, animated: true, completion: nil)
        } else {
            loadQuestion()
        }
    }
    
    @objc private func rightBarButtonTapped() {
        let popupViewController = PopupViewController()
        popupViewController.delegate = self
        popupViewController.modalPresentationStyle = .overCurrentContext
        present(popupViewController, animated: true, completion: nil)
    }
    
    // MARK: - Constraints Setup
    private func setupTableViewConstraints() {
        view.addSubview(subjectTableView)
        subjectTableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            subjectTableView.topAnchor.constraint(equalTo: questionBackground.bottomAnchor, constant: Constants.TableView.topAnchor),
            subjectTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            subjectTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    private func setupQuizProgressViewConstraints() {
        view.addSubview(quizProgressView)
        NSLayoutConstraint.activate([
            quizProgressView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            quizProgressView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            quizProgressView.bottomAnchor.constraint(equalTo: questionBackground.topAnchor, constant: Constants.QuizProgressView.bottomAnchor),
            quizProgressView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: Constants.QuizProgressView.topAnchor),
            quizProgressView.heightAnchor.constraint(equalToConstant: Constants.QuizProgressView.heightAnchor)
        ])
    }
    
    private func setupNextButtonConstraints() {
        view.addSubview(nextButton)
        nextButton.translatesAutoresizingMaskIntoConstraints = false
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
            questionBackground.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.QuestionBackground.leadingAnchor),
            questionBackground.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: Constants.QuestionBackground.trailingAnchor),
            questionBackground.heightAnchor.constraint(equalToConstant: Constants.QuestionBackground.heightAnchor),
            questionBackground.widthAnchor.constraint(equalToConstant: Constants.QuestionBackground.widthAnchor)
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
    
    func setCorrectCellAppearance() {
        guard let correctIndex = quizViewModel.questions[quizViewModel.currentQuestionIndex].answers.firstIndex(where: { $0.isCorrect }) else {
            return
        }
        let correctCell = subjectTableView.cellForRow(at: IndexPath(row: correctIndex, section: 0)) as? AnswerCell
        correctCell?.changeBackgroundColor(isCorrect: true)
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
        quizViewModel.questions[quizViewModel.currentQuestionIndex].answers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AnswerCell.reuseIdentifier, for: indexPath) as! AnswerCell
        let currentAnswer = quizViewModel.questions[quizViewModel.currentQuestionIndex].answers[indexPath.row]
        cell.configure(with: currentAnswer)
        return cell
    }
}

// MARK: - UITableViewDelegate
extension QuizViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let cellHeight = Constants.TableViewCell.cellHeight
        let distanceBetweenCells = Constants.TableViewCell.distanceBetweenCells
        return cellHeight + distanceBetweenCells
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let isCorrect = quizViewModel.questions[quizViewModel.currentQuestionIndex].answers[indexPath.row].isCorrect
        let cell = tableView.cellForRow(at: indexPath) as? AnswerCell
        cell?.changeBackgroundColor(isCorrect: isCorrect)
        
        if isCorrect {
            cell?.scoreImage.isHidden = false
            quizViewModel.correctAnswer += 1
            quizProgressView.currentScoreLabel.text = "მიმდინარე ქულა - \(quizViewModel.correctAnswer)⭐️"
        } else {
            setCorrectCellAppearance()
        }
    }
}

// MARK: - Constants
private extension QuizViewController {
    enum Constants {
        
        enum QuestionBackground {
            static let backgroundColor: UIColor = UIColor(hex: "C0D0F6")
            static let cornerRadius: CGFloat = 26
            static let heightAnchor: CGFloat = 103
            static let leadingAnchor: CGFloat = 16
            static let trailingAnchor: CGFloat = -16
            static let widthAnchor: CGFloat = 343
        }
        
        enum QuestionLabel {
            static let textColor: UIColor = .black
            static let backgroundColor: UIColor = .clear
            static let numberOfLines = 3
            static let font: CGFloat = 16
            static let topAnchor: CGFloat = 16
            static let leadingAnchor: CGFloat = 50
            static let trailingAnchor: CGFloat = -50
            static let widthAnchor: CGFloat = 200
            static let bottomAnchor: CGFloat = -16
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
        
        enum QuizProgressView {
            static let bottomAnchor: CGFloat = -8
            static let topAnchor: CGFloat = 16
            static let heightAnchor: CGFloat = 36
        }
    }
}
