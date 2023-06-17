//
//  GPADetailViewController.swift
//  QuizApp
//
//  Created by Giorgi Makadze on 06.06.2023.
//

import Foundation
import UIKit

class GPADetailViewController: UIViewController {
    
    // MARK: - Components
    private lazy var subjectTableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.dataSource = self
        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(ScoreCell.self, forCellReuseIdentifier: ScoreCell.reuseIdentifier)
        view.addSubview(tableView)
        return tableView
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
        setupTableViewConstraints()
        setupNavigationController()
    }
    
    func setupNavigationController() {
        navigationItem.setHidesBackButton(true, animated: false)
        navigationItem.title = "დაგროვილი ქულები ⭐️"
        
        let leftBarButtonItem = UIBarButtonItem(title: "<", style: .plain, target: self, action: #selector(leftBarButtonTapped))
        leftBarButtonItem.tintColor = .black
        navigationItem.leftBarButtonItem = leftBarButtonItem
    }
    
    @objc func leftBarButtonTapped() {
        self.navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Constraints Setup
    private func setupTableViewConstraints() {
        NSLayoutConstraint.activate([
            subjectTableView.topAnchor.constraint(equalTo: view.topAnchor),
            subjectTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            subjectTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            subjectTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: Constants.TableView.bottomAnchor)
        ])
    }

    private func noPointsImageConstraints() {
        NSLayoutConstraint.activate([
            noPointsImage.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            noPointsImage.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}

// MARK: - UITableViewDataSource
extension GPADetailViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        subjects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ScoreCell.reuseIdentifier, for: indexPath) as! ScoreCell
        let subject = subjects[indexPath.row]
        cell.configure(with: subject)
        return cell
    }
}

// MARK: - UITableViewDelegate
extension GPADetailViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let cellHeight = Constants.TableView.cellHeight
        let distanceBetweenCells = Constants.TableView.distanceBetweenCells
        let totalHeight = cellHeight + distanceBetweenCells
        return totalHeight
    }
}

// MARK: - Constants
private extension GPADetailViewController {
    enum Constants {
        
        enum PointLabel {
            static let textColor: UIColor  = .black
            static let text = "დაგროვილი ქულები"
            static let font: UIFont = .systemFont(ofSize: 16)
            static let backgroundColor: UIColor = .clear
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



