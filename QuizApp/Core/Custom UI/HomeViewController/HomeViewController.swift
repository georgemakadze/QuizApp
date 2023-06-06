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
    let detailViewController = DetailViewController()
    let quizController = QuizController()
    
    private lazy var scoreView: UIView = {
        let scoreView = UIView()
        scoreView.backgroundColor = UIColor(hex: "537FE7")
        scoreView.layer.cornerRadius = 26
        scoreView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scoreView)
        return scoreView
    }()
    
    private lazy var gpaView: UIView = {
        let gpaView = UIView()
        gpaView.backgroundColor = UIColor(hex: "6B91EA")
        gpaView.layer.cornerRadius = 14
        gpaView.translatesAutoresizingMaskIntoConstraints = false
        scoreView.addSubview(gpaView)
        return gpaView
    }()
    
    private lazy var gpaText: UILabel = {
        let gpaText = UILabel()
        gpaText.text = "GPA -"
        gpaText.font = .systemFont(ofSize: 16)
        gpaText.backgroundColor = .clear
        gpaText.textColor = .white
        gpaText.translatesAutoresizingMaskIntoConstraints = false
        gpaView.addSubview(gpaText)
        return gpaText
    }()
    
    private lazy var gpaScore: UILabel = {
        var gpaScore = UILabel()
        gpaScore.text = "1.0"
        gpaScore.font = .systemFont(ofSize: 16)
        gpaScore.backgroundColor = .clear
        gpaScore.textColor = UIColor(hex: "FFD24C")
        gpaScore.translatesAutoresizingMaskIntoConstraints = false
        gpaView.addSubview(gpaScore)
        return gpaScore
    }()
    
    private lazy var detailedText: UILabel = {
        let detailedText = UILabel()
        detailedText.text = "დეტალურად"
        detailedText.font = .systemFont(ofSize: 16)
        detailedText.textColor = .white
        detailedText.backgroundColor = .clear
        detailedText.translatesAutoresizingMaskIntoConstraints = false
        scoreView.addSubview(detailedText)
        return detailedText
    }()
    
    private lazy var detailedButton: UIButton = {
        let detailedButton = UIButton()
        detailedButton.setImage(UIImage(named: "Polygon"), for: .normal)
        detailedButton.addTarget(self, action: #selector(detailedButtonTapped),  for: .touchUpInside)
        detailedButton.translatesAutoresizingMaskIntoConstraints = false
        scoreView.addSubview(detailedButton)
        return detailedButton
    }()
    
    private lazy var chooseText: UILabel = {
        let chooseText = UILabel()
        chooseText.text = "აირჩიე საგანი"
        chooseText.textColor = .black
        chooseText.font = .systemFont(ofSize: 16)
        chooseText.backgroundColor = .clear
        chooseText.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(chooseText)
        return chooseText
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
        scoreViewConstraints()
        gpaViewConstrains()
        gpaTextConstraints()
        gpaScoreConstraints()
        detailedTextConstraints()
        detailedButtonConstraints()
        chooseTextConstraints()
        setupTableView()
        tableViewConstraints()
    }
    
    @objc func detailedButtonTapped() {
        self.navigationController?.pushViewController(detailViewController, animated: true)
    }
    
    func setupTableView() {
        tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(SubjectCell.self, forCellReuseIdentifier: "SubjectCell")
        view.addSubview(tableView)
    }
    
    func tableViewConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: chooseText.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -52)
        ])
    }
    
    func scoreViewConstraints() {
        NSLayoutConstraint.activate([
            scoreView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            scoreView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            scoreView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            scoreView.widthAnchor.constraint(equalToConstant: 344),
            scoreView.heightAnchor.constraint(equalToConstant: 76)
        ])
    }
    
    func gpaViewConstrains() {
        NSLayoutConstraint.activate([
            gpaView.topAnchor.constraint(equalTo: scoreView.topAnchor, constant: 16),
            gpaView.bottomAnchor.constraint(equalTo: scoreView.bottomAnchor, constant: -16),
            gpaView.leadingAnchor.constraint(equalTo: scoreView.leadingAnchor, constant: 18),
            gpaView.widthAnchor.constraint(equalToConstant: 88),
            gpaView.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    func gpaTextConstraints() {
        NSLayoutConstraint.activate([
            gpaText.topAnchor.constraint(equalTo: gpaView.topAnchor, constant: 6),
            gpaText.bottomAnchor.constraint(equalTo: gpaView.bottomAnchor, constant: -6),
            gpaText.leadingAnchor.constraint(equalTo: gpaView.leadingAnchor, constant: 10),
        ])
    }
    
    func gpaScoreConstraints(){
        NSLayoutConstraint.activate([
            gpaScore.topAnchor.constraint(equalTo: gpaView.topAnchor, constant: 6),
            gpaScore.bottomAnchor.constraint(equalTo: gpaView.bottomAnchor, constant: -6),
            gpaScore.trailingAnchor.constraint(equalTo: gpaView.trailingAnchor, constant: -10),
            gpaScore.leadingAnchor.constraint(equalTo: gpaText.trailingAnchor,constant: 2)
            
        ])
    }
    
    func detailedTextConstraints() {
        NSLayoutConstraint.activate([
            detailedText.topAnchor.constraint(equalTo: scoreView.topAnchor, constant: 28),
            detailedText.bottomAnchor.constraint(equalTo: scoreView.bottomAnchor, constant: -29),
        ])
    }
    
    func  detailedButtonConstraints() {
        NSLayoutConstraint.activate([
            detailedButton.topAnchor.constraint(equalTo: scoreView.topAnchor, constant: 30),
            detailedButton.bottomAnchor.constraint(equalTo: scoreView.bottomAnchor, constant: -31),
            detailedButton.trailingAnchor.constraint(equalTo: scoreView.trailingAnchor, constant: -34),
            detailedButton.leadingAnchor.constraint(equalTo: detailedText.trailingAnchor, constant: 4)
        ])
    }
    
    func chooseTextConstraints() {
        NSLayoutConstraint.activate([
            chooseText.topAnchor.constraint(equalTo: scoreView.bottomAnchor, constant: 32),
            chooseText.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
        ])
    }
}

extension HomeViewController: SubjectCellDelegate {
    func didTapButton(in cell: SubjectCell) {
        navigationController?.pushViewController(quizController, animated: true)
    }
    
    
}

extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return subjects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SubjectCell", for: indexPath) as! SubjectCell
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
