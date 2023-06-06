//
//  DetailViewController.swift
//  QuizApp
//
//  Created by Giorgi Makadze on 06.06.2023.
//

import Foundation
import UIKit

class DetailViewController: UIViewController {
    
    private var tableView: UITableView!
    
    private lazy var pointLabel: UILabel = {
        let pointLabel = UILabel()
        pointLabel.text = "დაგროვილი ქულები"
        pointLabel.font = .systemFont(ofSize: 16)
        pointLabel.textColor = .black
        pointLabel.backgroundColor = .clear
        pointLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(pointLabel)
        return pointLabel
    }()
    
    private lazy var starImage: UIImageView = {
        let starImage = UIImageView()
        starImage.image = UIImage(named: "Star")
        starImage.contentMode = .scaleAspectFill
        starImage.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(starImage)
        return starImage
    }()
    
    private lazy var noPointsImage: UIImageView = {
        let noPointsImage = UIImageView()
        noPointsImage.image = UIImage(named: "NoPoints")
        noPointsImage.contentMode = .scaleAspectFill
        noPointsImage.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(noPointsImage)
        return noPointsImage
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
        pointLabelConstraints()
        starImageConstraints()
//        setupTableView()
//        tableViewConstraints()
        noPointsImageConstraints()
        
    }
    
//    func setupTableView() {
//        tableView = UITableView()
//        //tableView.backgroundColor = .red
//        tableView.dataSource = self
//        tableView.delegate = self
//        tableView.translatesAutoresizingMaskIntoConstraints = false
//        tableView.register(SubjectCell.self, forCellReuseIdentifier: "SubjectCell")
//        view.addSubview(tableView)
//    }
    
//    func tableViewConstraints() {
//        NSLayoutConstraint.activate([
//            tableView.topAnchor.constraint(equalTo: pointLabel.bottomAnchor),
//            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -52)
//        ])
//    }
    
    
    func pointLabelConstraints() {
        NSLayoutConstraint.activate([
            pointLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 66),
            pointLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 99),
        ])
    }
    
    func starImageConstraints() {
        NSLayoutConstraint.activate([
            starImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 70),
            starImage.leadingAnchor.constraint(equalTo: pointLabel.trailingAnchor, constant: 5),
        ])
    }
    
    func noPointsImageConstraints() {
        NSLayoutConstraint.activate([
            noPointsImage.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            noPointsImage.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}

//extension DetailViewController: UITableViewDataSource {
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//           return subjects.count
//       }
//
//       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//           let cell = tableView.dequeueReusableCell(withIdentifier: "SubjectCell", for: indexPath) as! SubjectCell
//           let subject = subjects[indexPath.row]
//           cell.configure(with: subject)
//           return cell
//       }
//
//}
//
//extension DetailViewController: UITableViewDelegate {
//
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        let cellHeight: CGFloat = 106
//        let distanceBetweenCells: CGFloat = 20
//        let totalHeight = cellHeight + distanceBetweenCells
//
//        return totalHeight
//    }
//
//}



