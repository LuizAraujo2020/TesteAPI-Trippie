//
//  HomeTableViewCell.swift
//  Trippie
//
//  Created by Johnny Camacho on 19/05/22.
//

import Foundation
import UIKit

class HomeTableViewCell: UITableViewCell {
    
    static let cellIdentifier = "TripsCells"
    
    private lazy var backgroundLabel: UIView = {
        let backgroundLabel = UIView()
        
        backgroundLabel.backgroundColor = .white
        backgroundLabel.layer.cornerRadius = 15
        backgroundLabel.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        
        return backgroundLabel
    }()
    
    lazy var thumbCity: UIImageView = {
        let thumbCity = UIImageView()
        
        thumbCity.image = UIImage(named: "PlaceholderCity")
        
        return thumbCity
    }()
    
    lazy var cityLabel: UILabel = {
        let cityLabel = UILabel()
        
        cityLabel.text = "Placeholder"
        cityLabel.font = .boldSystemFont(ofSize: 15)
        
        return cityLabel
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.masksToBounds = false
    }
    
    private func setupUI() {
        setupUICell()
        
        contentView.addSubview(thumbCity)
        contentView.addSubview(backgroundLabel)
        backgroundLabel.addSubview(cityLabel)
        
        thumbCity.translatesAutoresizingMaskIntoConstraints = false
        backgroundLabel.translatesAutoresizingMaskIntoConstraints = false
        cityLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            thumbCity.topAnchor.constraint(equalTo: contentView.topAnchor),
            thumbCity.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            thumbCity.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            thumbCity.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            backgroundLabel.heightAnchor.constraint(equalToConstant: 52),
            backgroundLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            backgroundLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            backgroundLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            cityLabel.topAnchor.constraint(equalTo: backgroundLabel.topAnchor, constant: 16),
            cityLabel.bottomAnchor.constraint(equalTo: backgroundLabel.bottomAnchor, constant: -16),
            cityLabel.leadingAnchor.constraint(equalTo: backgroundLabel.leadingAnchor, constant: 12)
        ])
    }
    
    private func setupUICell() {
        backgroundColor = .clear
        selectionStyle = .none
        
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowRadius = 2.0
        layer.shadowOpacity = 0.2
    }
    
    
}
