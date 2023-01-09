//
//  DetailsPageViewController.swift
//  20230107-DavidTodua-NYCSchools
//
//  Created by David Todua on 1/8/23.
//

import UIKit

class DetailsPageViewController: UIViewController {
    
    let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 0
        titleLabel.font = UIFont(name: "Georgia-Bold", size: 24)
        titleLabel.textColor = UIColor(named: "blueColor")
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleLabel
    }()
    
    let locationDetailsView: LabeledSquareView = {
        let locationDetailsView = LabeledSquareView()
        
        locationDetailsView.translatesAutoresizingMaskIntoConstraints = false
        return locationDetailsView
    }()
    
    let paragraphText: UILabel = {
        let paragraphText = UILabel()
        paragraphText.numberOfLines = 0
        paragraphText.font = UIFont(name: "Georgia", size: 17)
        
        paragraphText.translatesAutoresizingMaskIntoConstraints = false
        return paragraphText
    }()
    
    private let errorLabel: UILabel = {
        let errorLabel = UILabel()
        errorLabel.textAlignment = .center
        errorLabel.font = UIFont(name: "Georgia", size: 20)

        errorLabel.translatesAutoresizingMaskIntoConstraints = false
        return errorLabel
    }()
    
    let largeTitle: LargeTitleCenterView = {
        let largeTitle = LargeTitleCenterView()
        
        largeTitle.translatesAutoresizingMaskIntoConstraints = false
        return largeTitle
    }()
    
    var presenter: DetailsPagePresenter?
    
    static func instantiate(withConfigurator configurator: DetailsPageConfigurator) -> DetailsPageViewController {
        DetailsPageViewController(withConfigurator: configurator)
    }
    
    private init(withConfigurator configurator: DetailsPageConfigurator) {
        super.init(nibName: nil, bundle: nil)
        configurator.configure(controller: self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension DetailsPageViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        addSubviews()
        addConstraints()
        configureTitle()
        presenter?.configurelocationDetailsView(locationView: locationDetailsView)
        configureParagraph()
        self.view.backgroundColor = .systemGray5
    }
    
    private func addSubviews() {
        self.view.addSubview(titleLabel)
        self.view.addSubview(locationDetailsView)
        self.view.addSubview(paragraphText)
        self.view.addSubview(largeTitle)
        self.view.addSubview(errorLabel)
    }
    
    private func addConstraints() {
        addTitleLabelConstraints()
        addLocationDetailsViewConstraints()
        addParagraphTextConstraints()
        addLargeTitleConstraints()
        addErrorLabelConstraints()
    }
    
    private func addTitleLabelConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            titleLabel.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: Spacing.L.floatValue),
            titleLabel.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -Spacing.L.floatValue)
        ])
    }
    
    private func addLocationDetailsViewConstraints() {
        NSLayoutConstraint.activate([
            locationDetailsView.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 20),
            locationDetailsView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: Spacing.S.floatValue),
            locationDetailsView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -Spacing.S.floatValue)
        ])
    }
    
    private func addParagraphTextConstraints() {
        NSLayoutConstraint.activate([
            paragraphText.topAnchor.constraint(equalTo: locationDetailsView.bottomAnchor, constant: Spacing.S.floatValue),
            paragraphText.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: Spacing.S.floatValue),
            paragraphText.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -Spacing.S.floatValue)
        ])
    }
    
    private func addLargeTitleConstraints() {
        NSLayoutConstraint.activate([
            largeTitle.topAnchor.constraint(equalTo: paragraphText.bottomAnchor, constant: Spacing.S.floatValue),
            largeTitle.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: Spacing.S.floatValue),
            largeTitle.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -Spacing.S.floatValue),
            largeTitle.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    private func addErrorLabelConstraints() {
        NSLayoutConstraint.activate([
            errorLabel.topAnchor.constraint(equalTo: paragraphText.bottomAnchor, constant: Spacing.S.floatValue),
            errorLabel.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: Spacing.S.floatValue),
            errorLabel.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -Spacing.S.floatValue),
            errorLabel.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    private func configureTitle() {
        titleLabel.text = presenter?.getTitle()
    }
    
    private func configureParagraph() {
        paragraphText.text = presenter?.getParagraphOverview()
    }
}

extension DetailsPageViewController: DetailsPageView {
    func showErrorView(text: String) {
        errorLabel.text = text
        errorLabel.isHidden = false
    }
    
    func hideErrorView() {
        errorLabel.isHidden = true
    }
}
