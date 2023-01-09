//
//  LabeledSquareView.swift
//  20230107-DavidTodua-NYCSchools
//
//  Created by David Todua on 1/8/23.
//

import UIKit

class LabeledSquareView: UIView {
    
    let cityLabel: UILabel = {
        let cityLabel = UILabel()
        cityLabel.font = UIFont(name: "Georgia-Bold", size: 17)
        
        cityLabel.translatesAutoresizingMaskIntoConstraints = false
        return cityLabel
    }()
    
    let boroughLabel: UILabel = {
        let boroughLabel = UILabel()
        boroughLabel.font = UIFont(name: "Georgia-Bold", size: 17)
        
        boroughLabel.translatesAutoresizingMaskIntoConstraints = false
        return boroughLabel
    }()
    
    let addressLabel: UILabel = {
        let addressLabel = UILabel()
        addressLabel.font = UIFont(name: "Georgia-Bold", size: 17)
        
        addressLabel.translatesAutoresizingMaskIntoConstraints = false
        return addressLabel
    }()
    
    let zipCodeLabel: UILabel = {
        let zipCodeLabel = UILabel()
        zipCodeLabel.font = UIFont(name: "Georgia-Bold", size: 17)
        
        zipCodeLabel.translatesAutoresizingMaskIntoConstraints = false
        return zipCodeLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        addSubviews()
        addConstraints()
        setupContentView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        self.addSubview(cityLabel)
        self.addSubview(boroughLabel)
        self.addSubview(addressLabel)
        self.addSubview(zipCodeLabel)
    }
    
    private func addConstraints() {
        addConstraintsToStatusLabel()
        addConstraintsToSpeciesLabel()
        addConstraintsToGenderLabel()
        addConstraintsToOriginLabel()
    }
    
    private func addConstraintsToStatusLabel() {
        NSLayoutConstraint.activate([
            cityLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: Spacing.XS.floatValue),
            cityLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: Spacing.S.floatValue),
            cityLabel.rightAnchor.constraint(lessThanOrEqualTo: self.rightAnchor, constant: -Spacing.S.floatValue)
        ])
    }
    
    private func addConstraintsToSpeciesLabel() {
        NSLayoutConstraint.activate([
            boroughLabel.topAnchor.constraint(equalTo: cityLabel.bottomAnchor, constant: Spacing.XS.floatValue),
            boroughLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: Spacing.S.floatValue),
            boroughLabel.rightAnchor.constraint(lessThanOrEqualTo: self.rightAnchor, constant: -Spacing.S.floatValue)
        ])
    }    
    
    private func addConstraintsToGenderLabel() {
        NSLayoutConstraint.activate([
            addressLabel.topAnchor.constraint(equalTo: boroughLabel.bottomAnchor, constant: Spacing.XS.floatValue),
            addressLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: Spacing.S.floatValue),
            addressLabel.rightAnchor.constraint(lessThanOrEqualTo: self.rightAnchor, constant: -Spacing.S.floatValue)
        ])
    }
    
    private func addConstraintsToOriginLabel() {
        NSLayoutConstraint.activate([
            zipCodeLabel.topAnchor.constraint(equalTo: addressLabel.bottomAnchor, constant: Spacing.XS.floatValue),
            zipCodeLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: Spacing.S.floatValue),
            zipCodeLabel.rightAnchor.constraint(lessThanOrEqualTo: self.rightAnchor, constant: -Spacing.S.floatValue),
            zipCodeLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -Spacing.S.floatValue)
        ])
    }
    
    private func setupContentView() {
        self.layer.cornerRadius = 12
        self.layer.masksToBounds = true
        self.backgroundColor = .clear
    }
    
    private func setupColors(backgroundColor: UIColor, textColor: UIColor) {
        self.backgroundColor = backgroundColor
        self.cityLabel.textColor = textColor
        self.boroughLabel.textColor = textColor
        self.addressLabel.textColor = textColor
        self.zipCodeLabel.textColor = textColor
    }

}

extension LabeledSquareView {
    public func configure( model: LabelsSquaredModel) {
        self.cityLabel.text = "City: " + (model.city ?? "")
        self.boroughLabel.text = "Borough: " + (model.borough ?? "")
        self.addressLabel.text = "Address: " + (model.address ?? "")
        self.zipCodeLabel.text = "zipCode: " + (model.zipCode ?? "")
        setupColors(backgroundColor: model.backgroundColor, textColor: model.textColor)
    }
    
    struct LabelsSquaredModel {
        let city: String?
        let borough: String?
        let address: String?
        let zipCode: String?
        let backgroundColor: UIColor
        let textColor: UIColor
    }
}
