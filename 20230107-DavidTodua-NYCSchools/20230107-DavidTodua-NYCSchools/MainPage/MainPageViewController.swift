//
//  ViewController.swift
//  20230107-DavidTodua-NYCSchools
//
//  Created by David Todua on 1/7/23.
//

import UIKit

class MainPageViewController: UIViewController {
    
    var presenter: MainPagePresenter?
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private let errorLabel: UILabel = {
        let errorLabel = UILabel()
        errorLabel.textAlignment = .center
        
        errorLabel.translatesAutoresizingMaskIntoConstraints = false
        return errorLabel
    }()

    static func instantiate(withConfigurator configurator: MainPageConfigurator) -> MainPageViewController {
        MainPageViewController.init(withConfigurator: configurator)
    }
    
    private init(withConfigurator configurator: MainPageConfigurator) {
        super.init(nibName: nil, bundle: nil)
        configurator.configure(self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MainPageViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        setupSubviews()
        configureTableView()
        configureConstraints()
        setupNavigationBarTitle()
    }

    private func setupSubviews() {
        self.view.addSubview(tableView)
        self.view.addSubview(errorLabel)
    }
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            tableView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
 
            errorLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            errorLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            errorLabel.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            errorLabel.rightAnchor.constraint(equalTo: self.view.rightAnchor)
        ])
        
        errorLabel.isHidden = true
    }
    
    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(BigTitleTableViewCell.self, forCellReuseIdentifier: "bigTitleTableViewCell")
    }
    
    private func setupNavigationBarTitle() {
        self.navigationController?.navigationBar.topItem?.title = "NYC Schools"
        self.navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor : UIColor(named: "blueColor")!,
            NSAttributedString.Key.font: UIFont(name: "Georgia-Bold", size: 24)!
        ]
    }
}

extension MainPageViewController: MainPageView {
    func reloadTableView() {
        self.tableView.reloadData()
    }
    
    func showErrorView(text: String) {
        errorLabel.text = text
        errorLabel.isHidden = false
    }
    
    func hideErrorView() {
        errorLabel.isHidden = true
    }
}

extension MainPageViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.schoolsCount() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "bigTitleTableViewCell") as! BigTitleTableViewCell
        
        presenter?.configureCell(cell: cell, indexPath: indexPath)
        return cell
    }
}

extension MainPageViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.goToDetailsPage(indexPath: indexPath)
    }
}


