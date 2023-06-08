//
//  HomeViewController.swift
//  QuizApp
//
//  Created by Giorgi Makadze on 05.06.2023.
//

import Foundation
import UIKit

class HomeViewController: UIViewController {
    
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
        gpaTextLabel.font = .systemFont(ofSize: Constants.GpaTextLabel.font)
        gpaTextLabel.backgroundColor = .clear
        gpaTextLabel.textColor = .white
        gpaTextLabel.translatesAutoresizingMaskIntoConstraints = false
        gpaView.addSubview(gpaTextLabel)
        return gpaTextLabel
    }()
    
    private lazy var gpaScoreLabel: UILabel = {
        var gpaScoreLabel = UILabel()
        gpaScoreLabel.text = "1.0"
        gpaScoreLabel.font = .systemFont(ofSize: Constants.GpaScoreLabel.font)
        gpaScoreLabel.backgroundColor = .clear
        gpaScoreLabel.textColor = Constants.GpaScoreLabel.textColor
        gpaScoreLabel.translatesAutoresizingMaskIntoConstraints = false
        gpaView.addSubview(gpaScoreLabel)
        return gpaScoreLabel
    }()
    
    private lazy var scoreViewDetailLabel: UILabel = {
        let scoreViewDetailLabel = UILabel()
        scoreViewDetailLabel.text = "დეტალურად"
        scoreViewDetailLabel.font = .systemFont(ofSize: 16)
        scoreViewDetailLabel.textColor = .white
        scoreViewDetailLabel.backgroundColor = .clear
        scoreViewDetailLabel.translatesAutoresizingMaskIntoConstraints = false
        scoreHeaderView.addSubview(scoreViewDetailLabel)
        return scoreViewDetailLabel
    }()
    
    private lazy var scoreViewDetailButton: UIButton = {
        let scoreViewDetailButton = UIButton()
        scoreViewDetailButton.setImage(UIImage(named: "Polygon"), for: .normal)
        scoreViewDetailButton.addTarget(self, action: #selector(detailedButtonTapped),  for: .touchUpInside)
        scoreViewDetailButton.translatesAutoresizingMaskIntoConstraints = false
        scoreHeaderView.addSubview(scoreViewDetailButton)
        return scoreViewDetailButton
    }()
    
    private lazy var chooseSubjectLabel: UILabel = {
        let chooseSubjectLabel = UILabel()
        chooseSubjectLabel.text = "აირჩიე საგანი"
        chooseSubjectLabel.textColor = .black
        chooseSubjectLabel.font = .systemFont(ofSize: 16)
        chooseSubjectLabel.backgroundColor = .clear
        chooseSubjectLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(chooseSubjectLabel)
        return chooseSubjectLabel
    }()
    
    private lazy var logOutButton: UIButton  = {
        let logOutButton = UIButton()
        logOutButton.setImage(UIImage(named: "Log out"), for: .normal)
        logOutButton.addTarget(self, action: #selector(logOutButtonTapped), for: .touchUpInside)
        logOutButton.layer.cornerRadius = 21
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
    
    private func setupTableViewConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: chooseSubjectLabel.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -52)
        ])
    }
    
    private func setupLogOutButtonConstraints() {
        NSLayoutConstraint.activate([
            logOutButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -14),
            logOutButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            logOutButton.widthAnchor.constraint(equalToConstant: 42),
            logOutButton.heightAnchor.constraint(equalToConstant: 42)
        ])
    }
    
    private func setupScoreHeaderViewConstraints() {
        NSLayoutConstraint.activate([
            scoreHeaderView.topAnchor.constraint(equalTo: view.topAnchor, constant: Constants.ScoreHeaderView.topAnchor),
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
            scoreViewDetailLabel.topAnchor.constraint(equalTo: scoreHeaderView.topAnchor, constant: 28),
            scoreViewDetailLabel.bottomAnchor.constraint(equalTo: scoreHeaderView.bottomAnchor, constant: -29),
        ])
    }
    
    private func  setupScoreViewDetailButtonConstraints() {
        NSLayoutConstraint.activate([
            scoreViewDetailButton.topAnchor.constraint(equalTo: scoreHeaderView.topAnchor, constant: 30),
            scoreViewDetailButton.bottomAnchor.constraint(equalTo: scoreHeaderView.bottomAnchor, constant: -31),
            scoreViewDetailButton.trailingAnchor.constraint(equalTo: scoreHeaderView.trailingAnchor, constant: -34),
            scoreViewDetailButton.leadingAnchor.constraint(equalTo: scoreViewDetailLabel.trailingAnchor, constant: 4)
        ])
    }
    
    private func setupChooseSubjectLabelConstraints() {
        NSLayoutConstraint.activate([
            chooseSubjectLabel.topAnchor.constraint(equalTo: scoreHeaderView.bottomAnchor, constant: 32),
            chooseSubjectLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
        ])
    }
}

extension HomeViewController: SubjectCellDelegate {
    func didTapButton(in cell: SubjectCell) {
        let quizController = QuizViewController()
        navigationController?.pushViewController(quizController, animated: true)
    }
}

extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return subjects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SubjectCell.reuseIdentifier, for: indexPath) as! SubjectCell
        let subject = subjects[indexPath.row]
        cell.configure(with: subject)
        cell.delegate = self
        return cell
    }
}

extension HomeViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let cellHeight: CGFloat = 106
        let distanceBetweenCells: CGFloat = 20
        let totalHeight = cellHeight + distanceBetweenCells
        return totalHeight
    }
}

extension HomeViewController {
    enum Constants {
        enum ScoreHeaderView {
            static let backgroundColor = UIColor(hex: "537FE7")
            static let cornerRadius: CGFloat = 26
            static let topAnchor: CGFloat = 100
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
            static let font: CGFloat = 16
            static let topAnchor: CGFloat = 6
            static let bottomAnchor: CGFloat = -6
            static let leadingAnchor: CGFloat = 10
        }
        enum GpaScoreLabel {
            static let textColor = UIColor(hex: "FFD24C")
            static let font: CGFloat = 16
            static let trailingAnchor: CGFloat = -10
            static let topAnchor: CGFloat = 6
            static let bottomAnchor: CGFloat = -6
            static let leadingAnchor: CGFloat = 2
        }
        
    }
}



