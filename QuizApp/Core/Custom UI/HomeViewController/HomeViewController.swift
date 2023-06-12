//
//  HomeViewController.swift
//  QuizApp
//
//  Created by Giorgi Makadze on 05.06.2023.
//

import Foundation
import UIKit

class HomeViewController: UIViewController {
    
    //MARK: - Components
    
    private var tableView: UITableView!
    private lazy var scoreHeaderView: UIView = {
        let scoreHeaderView = UIView()
        scoreHeaderView.backgroundColor = Constants.ScoreHeaderView.backgroundColor
        scoreHeaderView.layer.cornerRadius = Constants.ScoreHeaderView.cornerRadius
        scoreHeaderView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scoreHeaderView)
        return scoreHeaderView
    }()
    
    private lazy var gpaView: UIView = {
        let gpaView = UIView()
        gpaView.backgroundColor = Constants.GpaView.backgroundColor
        gpaView.layer.cornerRadius = Constants.GpaView.cornerRadius
        gpaView.translatesAutoresizingMaskIntoConstraints = false
        scoreHeaderView.addSubview(gpaView)
        return gpaView
    }()
    
    private lazy var gpaTextLabel: UILabel = {
        let gpaTextLabel = UILabel()
        gpaTextLabel.text = Constants.GpaTextLabel.text
        gpaTextLabel.font = Constants.GpaTextLabel.font
        gpaTextLabel.backgroundColor = Constants.GpaTextLabel.backgroundColor
        gpaTextLabel.textColor = Constants.GpaTextLabel.textColor
        gpaTextLabel.translatesAutoresizingMaskIntoConstraints = false
        gpaView.addSubview(gpaTextLabel)
        return gpaTextLabel
    }()
    
    private lazy var gpaScoreLabel: UILabel = {
        var gpaScoreLabel = UILabel()
        gpaScoreLabel.text = Constants.GpaScoreLabel.text
        gpaScoreLabel.font = Constants.GpaScoreLabel.font
        gpaScoreLabel.backgroundColor = Constants.GpaScoreLabel.backgroundColor
        gpaScoreLabel.textColor = Constants.GpaScoreLabel.textColor
        gpaScoreLabel.translatesAutoresizingMaskIntoConstraints = false
        gpaView.addSubview(gpaScoreLabel)
        return gpaScoreLabel
    }()
    
    private lazy var scoreViewDetailLabel: UILabel = {
        let scoreViewDetailLabel = UILabel()
        scoreViewDetailLabel.text = Constants.ScoreViewDetailLabel.text
        scoreViewDetailLabel.font = Constants.ScoreViewDetailLabel.font
        scoreViewDetailLabel.textColor = Constants.ScoreViewDetailLabel.textColor
        scoreViewDetailLabel.backgroundColor = Constants.ScoreViewDetailLabel.backgroundColor
        scoreViewDetailLabel.translatesAutoresizingMaskIntoConstraints = false
        scoreHeaderView.addSubview(scoreViewDetailLabel)
        return scoreViewDetailLabel
    }()
    
    private lazy var scoreViewDetailButton: UIButton = {
        let scoreViewDetailButton = UIButton()
        scoreViewDetailButton.setImage(Constants.ScoreViewDetailButton.setImage, for: .normal)
        scoreViewDetailButton.addTarget(self, action: #selector(detailedButtonTapped),  for: .touchUpInside)
        scoreViewDetailButton.translatesAutoresizingMaskIntoConstraints = false
        scoreHeaderView.addSubview(scoreViewDetailButton)
        return scoreViewDetailButton
    }()
    
    private lazy var chooseSubjectLabel: UILabel = {
        let chooseSubjectLabel = UILabel()
        chooseSubjectLabel.text = Constants.ChooseSubjectLabel.text
        chooseSubjectLabel.textColor = Constants.ChooseSubjectLabel.textColor
        chooseSubjectLabel.font = Constants.ChooseSubjectLabel.font
        chooseSubjectLabel.backgroundColor = Constants.ChooseSubjectLabel.backgroundColor
        chooseSubjectLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(chooseSubjectLabel)
        return chooseSubjectLabel
    }()
    
    private lazy var logOutButton: UIButton  = {
        let logOutButton = UIButton()
        logOutButton.setImage(Constants.LogOutButton.setImage, for: .normal)
        logOutButton.addTarget(self, action: #selector(logOutButtonTapped), for: .touchUpInside)
        logOutButton.layer.cornerRadius = Constants.LogOutButton.cornerRadius
        logOutButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(logOutButton)
        return logOutButton
    }()
    
    let subjects: [Subject] = [
        Subject(icon: "programming", name: "პროგრამირება", description: "აღწერა"),
        Subject(icon: "Book", name: "ისტორია", description: "აღწერა"),
        Subject(icon: "Atom", name: "ფიზიკა", description: "აღწერა"),
        Subject(icon: "Globe", name: "გეოგრაფია", description: "აღწერა")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupScoreHeaderViewConstraints()
        setupGpaViewConstrains()
        setupGpaTextLabelConstraints()
        setupGpaScoreLabelConstraints()
        setupScoreViewDetailLabelConstraints()
        setupScoreViewDetailButtonConstraints()
        setupChooseSubjectLabelConstraints()
        setupTableView()
        setupTableViewConstraints()
        setupLogOutButtonConstraints()
    }
    
    @objc func detailedButtonTapped() {
        let detailViewController = GPADetailViewController()
        self.navigationController?.pushViewController(detailViewController, animated: true)
    }
    
    @objc func logOutButtonTapped() {
                        let popupViewController = PopupViewController()
                                popupViewController.modalPresentationStyle = .overCurrentContext
                                present(popupViewController, animated: true, completion: nil)
        
//        let finishPopupController = FinishPopupController()
//        finishPopupController.modalPresentationStyle = .overCurrentContext
//        present(finishPopupController, animated: true, completion: nil)
    }
    
    private func setupTableView() {
        tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.dataSource = self
        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(SubjectCell.self, forCellReuseIdentifier: SubjectCell.reuseIdentifier)
        view.addSubview(tableView)
    }
    
    // MARK: - Constraints Setup
    
    private func setupTableViewConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: chooseSubjectLabel.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: Constants.TableView.bottomAnchor)
        ])
    }
    
    private func setupLogOutButtonConstraints() {
        NSLayoutConstraint.activate([
            logOutButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: Constants.LogOutButton.bottomAnchor),
            logOutButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: Constants.LogOutButton.trailingAnchor),
            logOutButton.widthAnchor.constraint(equalToConstant: Constants.LogOutButton.widthAnchor),
            logOutButton.heightAnchor.constraint(equalToConstant: Constants.LogOutButton.heightAnchor)
        ])
    }
    
    private func setupScoreHeaderViewConstraints() {
        NSLayoutConstraint.activate([
            scoreHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: Constants.ScoreHeaderView.topAnchor),
            scoreHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.ScoreHeaderView.leadingAnchor),
            scoreHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: Constants.ScoreHeaderView.trailingAnchor),
            scoreHeaderView.widthAnchor.constraint(equalToConstant: Constants.ScoreHeaderView.widthAnchor),
            scoreHeaderView.heightAnchor.constraint(equalToConstant: Constants.ScoreHeaderView.heightAnchor)
        ])
    }
    
    private func setupGpaViewConstrains() {
        NSLayoutConstraint.activate([
            gpaView.topAnchor.constraint(equalTo: scoreHeaderView.topAnchor, constant: Constants.GpaView.topAnchor),
            gpaView.bottomAnchor.constraint(equalTo: scoreHeaderView.bottomAnchor, constant: Constants.GpaView.bottomAnchor),
            gpaView.leadingAnchor.constraint(equalTo: scoreHeaderView.leadingAnchor, constant: Constants.GpaView.leadingAnchor),
            gpaView.widthAnchor.constraint(equalToConstant: Constants.GpaView.widthAnchor),
            gpaView.heightAnchor.constraint(equalToConstant: Constants.GpaView.heightAnchor)
        ])
    }
    
    private func setupGpaTextLabelConstraints() {
        NSLayoutConstraint.activate([
            gpaTextLabel.topAnchor.constraint(equalTo: gpaView.topAnchor, constant: Constants.GpaTextLabel.topAnchor),
            gpaTextLabel.bottomAnchor.constraint(equalTo: gpaView.bottomAnchor, constant: Constants.GpaTextLabel.bottomAnchor),
            gpaTextLabel.leadingAnchor.constraint(equalTo: gpaView.leadingAnchor, constant: Constants.GpaTextLabel.leadingAnchor),
        ])
    }
    
    private func setupGpaScoreLabelConstraints(){
        NSLayoutConstraint.activate([
            gpaScoreLabel.topAnchor.constraint(equalTo: gpaView.topAnchor, constant: Constants.GpaScoreLabel.topAnchor),
            gpaScoreLabel.bottomAnchor.constraint(equalTo: gpaView.bottomAnchor, constant: Constants.GpaScoreLabel.bottomAnchor),
            gpaScoreLabel.trailingAnchor.constraint(equalTo: gpaView.trailingAnchor, constant: Constants.GpaScoreLabel.trailingAnchor),
            gpaScoreLabel.leadingAnchor.constraint(equalTo: gpaTextLabel.trailingAnchor,constant: Constants.GpaScoreLabel.leadingAnchor)
        ])
    }
    
    private func setupScoreViewDetailLabelConstraints() {
        NSLayoutConstraint.activate([
            scoreViewDetailLabel.topAnchor.constraint(equalTo: scoreHeaderView.topAnchor, constant: Constants.ScoreViewDetailLabel.topAnchor),
            scoreViewDetailLabel.bottomAnchor.constraint(equalTo: scoreHeaderView.bottomAnchor, constant: Constants.ScoreViewDetailLabel.bottomAnchor)
        ])
    }
    
    private func  setupScoreViewDetailButtonConstraints() {
        NSLayoutConstraint.activate([
            scoreViewDetailButton.topAnchor.constraint(equalTo: scoreHeaderView.topAnchor, constant: Constants.ScoreViewDetailButton.topAnchor),
            scoreViewDetailButton.bottomAnchor.constraint(equalTo: scoreHeaderView.bottomAnchor, constant: Constants.ScoreViewDetailButton.bottomAnchor),
            scoreViewDetailButton.trailingAnchor.constraint(equalTo: scoreHeaderView.trailingAnchor, constant: Constants.ScoreViewDetailButton.trailingAnchor),
            scoreViewDetailButton.leadingAnchor.constraint(equalTo: scoreViewDetailLabel.trailingAnchor, constant: Constants.ScoreViewDetailButton.leadingAnchor)
        ])
    }
    
    private func setupChooseSubjectLabelConstraints() {
        NSLayoutConstraint.activate([
            chooseSubjectLabel.topAnchor.constraint(equalTo: scoreHeaderView.bottomAnchor, constant: Constants.ChooseSubjectLabel.topAnchor),
            chooseSubjectLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.ChooseSubjectLabel.leadingAnchor),
        ])
    }
}

// MARK: - UITableViewDataSource

extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        subjects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SubjectCell.reuseIdentifier, for: indexPath) as! SubjectCell
        let subject = subjects[indexPath.row]
        cell.configure(with: subject)
        return cell
    }
}

// MARK: - UITableViewDelegate

extension HomeViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let quizController = QuizViewController()
        navigationController?.pushViewController(quizController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let cellHeight = Constants.TableViewCell.cellHeight
        let distanceBetweenCells = Constants.TableViewCell.distanceBetweenCells
        let totalHeight = cellHeight + distanceBetweenCells
        return totalHeight
    }
}

// MARK: - Constants

private extension HomeViewController {
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
            static let setImage = UIImage(named: "Polygon")
            static let topAnchor: CGFloat = 30
            static let leadingAnchor: CGFloat = 4
            static let trailingAnchor: CGFloat = -34
            static let bottomAnchor: CGFloat = -31
        }
        
        enum ChooseSubjectLabel {
            static let text = "აირჩიე საგანი"
            static let font: UIFont = .systemFont(ofSize: 16)
            static let topAnchor: CGFloat = 32
            static let leadingAnchor: CGFloat = 16
            static let textColor: UIColor = .black
            static let backgroundColor: UIColor = .clear
        }
        
        enum LogOutButton {
            static let setImage = UIImage(named: "Log out")
            static let cornerRadius: CGFloat = 21
            static let widthAnchor: CGFloat = 42
            static let heightAnchor: CGFloat = 42
            static let trailingAnchor: CGFloat = -16
            static let bottomAnchor: CGFloat = -14
        }
        
        enum TableView {
            static let bottomAnchor: CGFloat = -52
        }
        
        enum TableViewCell {
            static let cellHeight: CGFloat = 108
            static let distanceBetweenCells: CGFloat = 18
        }
    }
}



