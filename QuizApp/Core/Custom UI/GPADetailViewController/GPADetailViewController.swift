//
//  GPADetailViewController.swift
//  QuizApp
//
//  Created by Giorgi Makadze on 06.06.2023.
//

import Foundation
import UIKit

class GPADetailViewController: UIViewController {
    
    private var tableView: UITableView!
    
    private lazy var pointLabel: UILabel = {
        let pointLabel = UILabel()
        pointLabel.text = Constants.PointLabel.text
        pointLabel.font = .systemFont(ofSize: Constants.PointLabel.font)
        pointLabel.textColor = .black
        pointLabel.backgroundColor = .clear
        pointLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(pointLabel)
        return pointLabel
    }()
    
    private lazy var starImage: UIImageView = {
        let starImage = UIImageView()
        starImage.image = Constants.StarImage.image
        starImage.contentMode = .scaleAspectFill
        starImage.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(starImage)
        return starImage
    }()
    
    private lazy var noPointsImage: UIImageView = {
        let noPointsImage = UIImageView()
        noPointsImage.image = Constants.noPointsImage.image
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
        setupTableView()
        tableViewConstraints()
//        noPointsImageConstraints()
        
    }
    
    private func setupTableView() {
        tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.dataSource = self
        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(ScoreCell.self, forCellReuseIdentifier: ScoreCell.reuseIdentifier)
        view.addSubview(tableView)
    }
    
    private func tableViewConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: pointLabel.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: Constants.TableView.bottomAnchor)
        ])
    }
    
    
    private func pointLabelConstraints() {
        NSLayoutConstraint.activate([
            pointLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: Constants.PointLabel.topAnchor),
            pointLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.PointLabel.leadingAnchor),
        ])
    }
    
    private func starImageConstraints() {
        NSLayoutConstraint.activate([
            starImage.topAnchor.constraint(equalTo: view.topAnchor, constant: Constants.StarImage.topAnchor),
            starImage.leadingAnchor.constraint(equalTo: pointLabel.trailingAnchor, constant: Constants.StarImage.leadingAnchor),
        ])
    }
    
    func noPointsImageConstraints() {
        NSLayoutConstraint.activate([
            noPointsImage.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            noPointsImage.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}

extension GPADetailViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return subjects.count
       }

       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           let cell = tableView.dequeueReusableCell(withIdentifier: ScoreCell.reuseIdentifier, for: indexPath) as! ScoreCell
           let subject = subjects[indexPath.row]
           cell.configure(with: subject)
           return cell
       }
}

extension GPADetailViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let cellHeight = Constants.TableView.cellHeight
        let distanceBetweenCells = Constants.TableView.distanceBetweenCells
        let totalHeight = cellHeight + distanceBetweenCells
        return totalHeight
    }
}

extension GPADetailViewController {
    enum Constants {
        enum PointLabel {
            static let text = "დაგროვილი ქულები"
            static let font: CGFloat = 16
            static let topAnchor: CGFloat = 66
            static let leadingAnchor:CGFloat = 99
        }
        enum StarImage {
            static let image = UIImage(named: "Star")
            static let topAnchor: CGFloat = 70
            static let leadingAnchor: CGFloat = 5
        }
        enum noPointsImage {
            static let image = UIImage(named: "NoPoints")
        }
        enum TableView {
            static let bottomAnchor: CGFloat = -52
            static let cellHeight: CGFloat = 106
            static let distanceBetweenCells:CGFloat = 20
        }
    }
}



