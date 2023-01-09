//
//  TitledLabelTableViewCell.swift
//  20230107-DavidTodua-NYCSchools
//
//  Created by David Todua on 1/7/23.
//

import UIKit

class BigTitleTableViewCell: UITableViewCell {
    
    let mainLabel: UILabel = {
        let mainLabel = UILabel()
        mainLabel.font = UIFont(name: "Georgia-Bold", size: 17)
        
        mainLabel.translatesAutoresizingMaskIntoConstraints = false
        return mainLabel
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        addConstraints()
        setupContentView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        self.contentView.addSubview(mainLabel)
    }
    
    private func addConstraints() {
        addStatusLabelConstraints()
    }
    
    private func addStatusLabelConstraints() {
        NSLayoutConstraint.activate([
            mainLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: Spacing.M.floatValue),
            mainLabel.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: Spacing.M.floatValue),
            mainLabel.rightAnchor.constraint(lessThanOrEqualTo: self.contentView.rightAnchor, constant: -Spacing.XXL.floatValue),
            mainLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -Spacing.M.floatValue),
        ])
        
    }
    
    private func setupContentView() {
        self.backgroundColor = .clear
    }
    
    private func roundCorners(corners: CornerChoice) {
        switch corners {
        case .TopCorners:
            self.contentView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        case .BottomCorners:
            self.contentView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        case .allCorners:
            self.contentView.layer.masksToBounds = true
        case .none:
            return
        }
        self.contentView.layer.cornerRadius = 12
    }
}

extension BigTitleTableViewCell {
    enum CornerChoice {
        case TopCorners
        case BottomCorners
        case allCorners
        case none
    }
}

extension BigTitleTableViewCell {
    public func configure(title: String?,
                          backgroundColor: UIColor,
                          textColor: UIColor,
                          roundCorners: CornerChoice?) {
        self.mainLabel.text = (title ?? "")
        self.contentView.backgroundColor = backgroundColor
        self.mainLabel.textColor = textColor

        if let corners = roundCorners {
            self.roundCorners(corners: corners)
        }
    }
}

