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
    
    lazy var thumbDisplay: UIImageView = {
        let thumbDisplay = UIImageView()

        thumbDisplay.image = UIImage(named: "PlaceholderCity")

        return thumbDisplay
    }()
    
    lazy var labelDisplay: UILabel = {
        let labelDisplay = UILabel()
        
        labelDisplay.text = "Placeholder"
        labelDisplay.font = .boldSystemFont(ofSize: 15)
        
        return labelDisplay
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
        
        contentView.addSubview(thumbDisplay)
        contentView.addSubview(backgroundLabel)
        backgroundLabel.addSubview(labelDisplay)
        
        thumbDisplay.translatesAutoresizingMaskIntoConstraints = false
        backgroundLabel.translatesAutoresizingMaskIntoConstraints = false
        labelDisplay.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            thumbDisplay.topAnchor.constraint(equalTo: contentView.topAnchor),
            thumbDisplay.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            thumbDisplay.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            thumbDisplay.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            backgroundLabel.heightAnchor.constraint(equalToConstant: 52),
            backgroundLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            backgroundLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            backgroundLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            labelDisplay.topAnchor.constraint(equalTo: backgroundLabel.topAnchor, constant: 16),
            labelDisplay.bottomAnchor.constraint(equalTo: backgroundLabel.bottomAnchor, constant: -16),
            labelDisplay.leadingAnchor.constraint(equalTo: backgroundLabel.leadingAnchor, constant: 12)
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
