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
        scoreHeaderView.backgroundColor = UIColor(hex: "537FE7")
        scoreHeaderView.layer.cornerRadius = 26
        scoreHeaderView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scoreHeaderView)
        return scoreHeaderView
    }()
    
    private lazy var gpaView: UIView = {
        let gpaView = UIView()
        gpaView.backgroundColor = UIColor(hex: "6B91EA")
        gpaView.layer.cornerRadius = 14
        gpaView.translatesAutoresizingMaskIntoConstraints = false
        scoreHeaderView.addSubview(gpaView)
        return gpaView
    }()
    
    private lazy var gpaTextLabel: UILabel = {
        let gpaTextLabel = UILabel()
        gpaTextLabel.text = "GPA -"
        gpaTextLabel.font = .systemFont(ofSize: 16)
        gpaTextLabel.backgroundColor = .clear
        gpaTextLabel.textColor = .white
        gpaTextLabel.translatesAutoresizingMaskIntoConstraints = false
        gpaView.addSubview(gpaTextLabel)
        return gpaTextLabel
    }()
    
    private lazy var gpaScoreLabel: UILabel = {
        var gpaScoreLabel = UILabel()
        gpaScoreLabel.text = "1.0"
        gpaScoreLabel.font = .systemFont(ofSize: 16)
        gpaScoreLabel.backgroundColor = .clear
        gpaScoreLabel.textColor = UIColor(hex: "FFD24C")
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
    
    private lazy var popupView: UIView = {
        let popupView = UIView()
        popupView.backgroundColor = UIColor.yellow
        popupView.layer.cornerRadius = 8
        popupView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(popupView)
        return popupView
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
        popupView.isHidden = true
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
        setupPopupViewConstraints()
    }
    
    @objc func detailedButtonTapped() {
        let detailViewController = GPADetailViewController()
        self.navigationController?.pushViewController(detailViewController, animated: true)
    }
    
    @objc func logOutButtonTapped() {
        if popupView.isHidden {
            popupView.isHidden = false
            popupView.backgroundColor = .yellow
            //tableView.backgroundColor = .lightGray
            view.backgroundColor = .lightGray
        } else {
            popupView.isHidden = true
            view.backgroundColor = .white
        }
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
    
    private func setupPopupViewConstraints() {
        NSLayoutConstraint.activate([
            popupView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            popupView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            popupView.widthAnchor.constraint(equalToConstant: 270),
            popupView.heightAnchor.constraint(equalToConstant: 176)
        ])
    }
    
    private func setupScoreHeaderViewConstraints() {
        NSLayoutConstraint.activate([
            scoreHeaderView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            scoreHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            scoreHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            scoreHeaderView.widthAnchor.constraint(equalToConstant: 344),
            scoreHeaderView.heightAnchor.constraint(equalToConstant: 76)
        ])
    }
    
    private func setupGpaViewConstrains() {
        NSLayoutConstraint.activate([
            gpaView.topAnchor.constraint(equalTo: scoreHeaderView.topAnchor, constant: 16),
            gpaView.bottomAnchor.constraint(equalTo: scoreHeaderView.bottomAnchor, constant: -16),
            gpaView.leadingAnchor.constraint(equalTo: scoreHeaderView.leadingAnchor, constant: 18),
            gpaView.widthAnchor.constraint(equalToConstant: 88),
            gpaView.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    private func setupGpaTextLabelConstraints() {
        NSLayoutConstraint.activate([
            gpaTextLabel.topAnchor.constraint(equalTo: gpaView.topAnchor, constant: 6),
            gpaTextLabel.bottomAnchor.constraint(equalTo: gpaView.bottomAnchor, constant: -6),
            gpaTextLabel.leadingAnchor.constraint(equalTo: gpaView.leadingAnchor, constant: 10),
        ])
    }
    
    private func setupGpaScoreLabelConstraints(){
        NSLayoutConstraint.activate([
            gpaScoreLabel.topAnchor.constraint(equalTo: gpaView.topAnchor, constant: 6),
            gpaScoreLabel.bottomAnchor.constraint(equalTo: gpaView.bottomAnchor, constant: -6),
            gpaScoreLabel.trailingAnchor.constraint(equalTo: gpaView.trailingAnchor, constant: -10),
            gpaScoreLabel.leadingAnchor.constraint(equalTo: gpaTextLabel.trailingAnchor,constant: 2)
            
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




