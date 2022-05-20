//
//  TripThumbView.swift
//  Trippie
//
//  Created by Johnny Camacho on 20/05/22.
//

import Foundation
import UIKit

class TripThumbView: UIView {
    
    //MARK: - Properties
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
    
    //MARK: - LifeCycle
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        setupUI()
    }
    
    //MARK: - Helpers
    private func setupUI() {
        setupShadow()
        
        addSubview(thumbDisplay)
        thumbDisplay.addSubview(backgroundLabel)
        backgroundLabel.addSubview(labelDisplay)
        
        thumbDisplay.translatesAutoresizingMaskIntoConstraints = false
        backgroundLabel.translatesAutoresizingMaskIntoConstraints = false
        labelDisplay.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            thumbDisplay.heightAnchor.constraint(equalToConstant: 193),
            thumbDisplay.topAnchor.constraint(equalTo: self.topAnchor),
            thumbDisplay.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            thumbDisplay.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            thumbDisplay.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            backgroundLabel.heightAnchor.constraint(equalToConstant: 52),
            backgroundLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            backgroundLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            backgroundLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            labelDisplay.topAnchor.constraint(equalTo: backgroundLabel.topAnchor, constant: 16),
            labelDisplay.bottomAnchor.constraint(equalTo: backgroundLabel.bottomAnchor, constant: -16),
            labelDisplay.leadingAnchor.constraint(equalTo: backgroundLabel.leadingAnchor, constant: 12)
        ])
    }
    
    private func setupShadow() {
        backgroundColor = .clear
        
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowRadius = 2.0
        layer.shadowOpacity = 0.2
    }
    
}
