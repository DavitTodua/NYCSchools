//
//  BigCenteredView.swift
//  20230107-DavidTodua-NYCSchools
//
//  Created by David Todua on 1/8/23.
//

import UIKit

class LargeTitleCenterView: UIView {
    
    let largeTitle: UILabel = {
        let largeTitle = UILabel()
        largeTitle.font = UIFont(name: "Georgia-Bold", size: 20)
        
        largeTitle.translatesAutoresizingMaskIntoConstraints = false
        return largeTitle
    }()
    
    let separatorView: UIView = {
        let separatorView = UIView()
        
        separatorView.translatesAutoresizingMaskIntoConstraints = false
        return separatorView
    }()
    
    let firstLabel: UILabel = {
        let firstLabel = UILabel()
        firstLabel.font = UIFont(name: "Georgia-Bold", size: 15)

        firstLabel.translatesAutoresizingMaskIntoConstraints = false
        return firstLabel
    }()
    
    let secondLabel: UILabel = {
        let secondLabel = UILabel()
        secondLabel.font = UIFont(name: "Georgia-Bold", size: 15)

        secondLabel.translatesAutoresizingMaskIntoConstraints = false
        return secondLabel
    }()
    
    let thirdLabel: UILabel = {
        let thirdLabel = UILabel()
        thirdLabel.font = UIFont(name: "Georgia-Bold", size: 15)

        thirdLabel.translatesAutoresizingMaskIntoConstraints = false
        return thirdLabel
    }()
    
    let fourthLabel: UILabel = {
        let fourthLabel = UILabel()
        fourthLabel.font = UIFont(name: "Georgia-Bold", size: 15)
        fourthLabel.translatesAutoresizingMaskIntoConstraints = false
        return fourthLabel
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        addSubviews()
        addConstraints()
        roundCorners()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        self.addSubview(largeTitle)
        self.addSubview(separatorView)
        self.addSubview(firstLabel)
        self.addSubview(secondLabel)
        self.addSubview(thirdLabel)
        self.addSubview(fourthLabel)
    }

    private func addConstraints() {
        addLargeTitleConstraints()
        addSeparatorViewConstraints()
        addFirstLabelConstraints()
        addSecondLabelConstraints()
        addThirdLabelConstraints()
        addfourthLabelConstraints()
        
    }
    
    private func addLargeTitleConstraints() {
        NSLayoutConstraint.activate([
            largeTitle.topAnchor.constraint(equalTo: self.topAnchor),
            largeTitle.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 12),
            largeTitle.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -12),
        ])
    }
    
    private func addSeparatorViewConstraints() {
        NSLayoutConstraint.activate([
            separatorView.topAnchor.constraint(equalTo: self.largeTitle.bottomAnchor, constant: -Spacing.XXL.floatValue),
            separatorView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8),
            separatorView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -8),
            separatorView.bottomAnchor.constraint(equalTo: firstLabel.topAnchor, constant: -Spacing.S.floatValue),
            separatorView.heightAnchor.constraint(equalToConstant: 1.5)
        ])
    }
    
    private func addFirstLabelConstraints() {
        NSLayoutConstraint.activate([
            firstLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 12),
            firstLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -12)
        ])
    }
    
    private func addSecondLabelConstraints() {
        NSLayoutConstraint.activate([
            secondLabel.topAnchor.constraint(equalTo: self.firstLabel.bottomAnchor, constant: Spacing.XS.floatValue),
            secondLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 12),
            secondLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -12),
        ])
    }
    
    private func addThirdLabelConstraints() {
        NSLayoutConstraint.activate([
            thirdLabel.topAnchor.constraint(equalTo: self.secondLabel.bottomAnchor, constant: Spacing.XS.floatValue),
            thirdLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 12),
            thirdLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -12),
        ])
    }
    
    private func addfourthLabelConstraints() {
        NSLayoutConstraint.activate([
            fourthLabel.topAnchor.constraint(equalTo: self.thirdLabel.bottomAnchor, constant: Spacing.XS.floatValue),
            fourthLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 12),
            fourthLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -12),
            fourthLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -Spacing.XXL
                .floatValue)
        ])
    }
    
    private func roundCorners() {
        self.layer.cornerRadius = 12
        self.layer.masksToBounds = true
    }
}

extension LargeTitleCenterView {
    public func configure(title: String,
                          firstText: String,
                          secondText: String,
                          thirdText: String,
                          fourthText: String,
                          backgroundColor: UIColor,
                          separatorColor: UIColor) {
        self.largeTitle.text = title
        self.backgroundColor = backgroundColor
        self.separatorView.backgroundColor = separatorColor
        self.firstLabel.text = firstText
        self.secondLabel.text = secondText
        self.thirdLabel.text = thirdText
        self.fourthLabel.text = fourthText
    }
}

