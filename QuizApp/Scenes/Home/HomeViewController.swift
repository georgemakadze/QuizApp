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
    private let homeViewModel: HomeViewModel
    
    private lazy var gpaView: GPAView = {
        let gpaView = GPAView()
        gpaView.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(scoreHeaderViewTapped))
        gpaView.addGestureRecognizer(tapGesture)
        gpaView.translatesAutoresizingMaskIntoConstraints = false
        return gpaView
    }()
    
    private lazy var subjectTableView: UITableView = {
        let subjectTableView = UITableView()
        subjectTableView.separatorStyle = .none
        subjectTableView.dataSource = self
        subjectTableView.delegate = self
        subjectTableView.register(SubjectCell.self, forCellReuseIdentifier: SubjectCell.reuseIdentifier)
        return subjectTableView
    }()
    
    private let chooseSubjectLabel: UILabel = {
        let chooseSubjectLabel = UILabel()
        chooseSubjectLabel.text = Constants.ChooseSubjectLabel.text
        chooseSubjectLabel.textColor = Constants.ChooseSubjectLabel.textColor
        chooseSubjectLabel.font = Constants.ChooseSubjectLabel.font
        chooseSubjectLabel.backgroundColor = Constants.ChooseSubjectLabel.backgroundColor
        chooseSubjectLabel.translatesAutoresizingMaskIntoConstraints = false
        return chooseSubjectLabel
    }()
    
    private let dividerView: UIView = {
        let dividerView = UIView()
        dividerView.backgroundColor = Constants.DividerView.backgroundColor
        dividerView.translatesAutoresizingMaskIntoConstraints = false
        return dividerView
    }()
    
    private lazy var logOutButton: UIButton  = {
        let logOutButton = UIButton()
        logOutButton.setImage(Constants.LogOutButton.image, for: .normal)
        logOutButton.addTarget(self, action: #selector(logOutButtonTapped), for: .touchUpInside)
        logOutButton.layer.cornerRadius = Constants.LogOutButton.cornerRadius
        return logOutButton
    }()
    
    init(with viewModel: HomeViewModel) {
        homeViewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupNavigationController()
        setupGPAViewConstraints()
        setupChooseSubjectLabelConstraints()
        setupTableViewConstraints()
        setupLogOutButtonConstraints()
        setupDividerViewConstraints()
        homeViewModel.loadJSONFile() { [weak self] in
            self?.subjectTableView.reloadData()
        }
    }
    
    func setupNavigationController() {
        let titleLabel = UILabel()
        titleLabel.text = "გამარჯობა,\(homeViewModel.username)"
        titleLabel.font = Constants.TitleLabel.font
        titleLabel.textColor = Constants.TitleLabel.textColor
        
        let titleView = UIView()
        titleView.addSubview(titleLabel)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: titleView.leadingAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: titleView.centerYAnchor)
        ])
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: titleView)
    }
    
    @objc private func scoreHeaderViewTapped() {
        let detailViewController = GPADetailViewController()
        self.navigationController?.pushViewController(detailViewController, animated: true)
    }
    
    @objc func logOutButtonTapped() {
        let popupViewController = PopupViewController(withText: Constants.Popup.text)
        popupViewController.delegate = self
        popupViewController.modalPresentationStyle = .overCurrentContext
        present(popupViewController, animated: true, completion: nil)
    }
    
    // MARK: - Constraints Setup
    private func setupGPAViewConstraints() {
        view.addSubview(gpaView)
        NSLayoutConstraint.activate([
            gpaView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: Constants.GPAView.topAnchor),
            gpaView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.GPAView.leadingAnchor),
            gpaView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: Constants.GPAView.trailingAnchor),
            gpaView.heightAnchor.constraint(equalToConstant: Constants.GPAView.heightAnchor)
        ])
    }
    
    private func setupTableViewConstraints() {
        view.addSubview(subjectTableView)
        subjectTableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            subjectTableView.topAnchor.constraint(equalTo: chooseSubjectLabel.bottomAnchor),
            subjectTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            subjectTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            subjectTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: Constants.TableView.bottomAnchor)
        ])
    }
    
    private func setupLogOutButtonConstraints() {
        view.addSubview(logOutButton)
        logOutButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            logOutButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: Constants.LogOutButton.bottomAnchor),
            logOutButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: Constants.LogOutButton.trailingAnchor),
            logOutButton.widthAnchor.constraint(equalToConstant: Constants.LogOutButton.widthAnchor),
            logOutButton.heightAnchor.constraint(equalToConstant: Constants.LogOutButton.heightAnchor)
        ])
    }
    
    private func setupDividerViewConstraints() {
        view.addSubview(dividerView)
        NSLayoutConstraint.activate([
            dividerView.topAnchor.constraint(equalTo: subjectTableView.bottomAnchor),
            dividerView.bottomAnchor.constraint(equalTo: logOutButton.topAnchor, constant: Constants.DividerView.bottomAnchor),
            dividerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            dividerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            dividerView.heightAnchor.constraint(equalToConstant: Constants.DividerView.heightAnchor)
        ])
    }
    
    private func setupChooseSubjectLabelConstraints() {
        view.addSubview(chooseSubjectLabel)
        NSLayoutConstraint.activate([
            chooseSubjectLabel.topAnchor.constraint(equalTo: gpaView.bottomAnchor, constant: Constants.ChooseSubjectLabel.topAnchor),
            chooseSubjectLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.ChooseSubjectLabel.leadingAnchor),
        ])
    }
}

// MARK: - PopupViewControllerDelegate
extension HomeViewController: PopupViewControllerDelegate {
    func didTapYesButton() {
        window?.rootViewController = LoginViewController()
    }
    func didTapNoButton() {
        dismiss(animated: true, completion: nil)
    }
}

// MARK: - UITableViewDataSource
extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        homeViewModel.subjects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SubjectCell.reuseIdentifier, for: indexPath) as! SubjectCell
        let subject = homeViewModel.subjects[indexPath.row]
        cell.configure(with: subject)
        return cell
    }
}

// MARK: - UITableViewDelegate
extension HomeViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedSubject = homeViewModel.subjects[indexPath.row]
        let quizViewModel = QuizViewModel(subject: selectedSubject)
        let quizController = QuizViewController(with: quizViewModel)
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
        
        enum GPAView {
            static let backgroundColor = UIColor(hex: "537FE7")
            static let cornerRadius: CGFloat = 26
            static let topAnchor: CGFloat = 20
            static let leadingAnchor: CGFloat = 16
            static let trailingAnchor: CGFloat = -16
            static let widthAnchor: CGFloat = 344
            static let heightAnchor: CGFloat = 76
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
            static let image = UIImage(named: "Log out")
            static let cornerRadius: CGFloat = 21
            static let widthAnchor: CGFloat = 42
            static let heightAnchor: CGFloat = 42
            static let trailingAnchor: CGFloat = -16
            static let bottomAnchor: CGFloat = -14
        }
        
        enum TableView {
            static let bottomAnchor: CGFloat = -60
        }
        
        enum TableViewCell {
            static let cellHeight: CGFloat = 108
            static let distanceBetweenCells: CGFloat = 18
        }
        
        enum TitleLabel {
            static let font = UIFont.boldSystemFont(ofSize: 16)
            static let textColor = UIColor(hex: "FFC44A")
        }
        
        enum DividerView {
            static let backgroundColor = UIColor(hex: "F1F1F1")
            static let bottomAnchor: CGFloat = -4
            static let heightAnchor: CGFloat = 1
        }
        
        enum Popup {
            static let text = "ნამდვილად გსურს გასვლა?"
        }
    }
}
