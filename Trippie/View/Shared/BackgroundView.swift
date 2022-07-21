//
//  BackgroundView.swift
//  Trippie
//
//  Created by Johnny Camacho on 20/07/22.
//

import Foundation
import UIKit

class BackgroundView: UIView {
    
    //MARK: - Properties
    lazy var backgroundLabel: UIView = {
        let backgroundLabel = UIView()
        
        backgroundLabel.backgroundColor = .white
        backgroundLabel.layer.cornerRadius = 15
        backgroundLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return backgroundLabel
    }()
    
    lazy var labelDisplay: UILabel = {
        let labelDisplay = UILabel()
        
        labelDisplay.text = "Placeholder"
        labelDisplay.font = .boldSystemFont(ofSize: 15)
        labelDisplay.translatesAutoresizingMaskIntoConstraints = false
        
        return labelDisplay
    }()
    
    private let alignLabel: Bool
    
    //MARK: - LifeCycle
    init(frame: CGRect = CGRect(), alignLabel: Bool = false) {
        self.alignLabel = alignLabel
        
        super.init(frame: frame)
    }
    
    convenience init() {
        self.init(frame: CGRect())
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
        
        addSubview(backgroundLabel)
        
        backgroundLabel.addSubview(labelDisplay)
        
        NSLayoutConstraint.activate([
            backgroundLabel.topAnchor.constraint(equalTo: self.topAnchor),
            backgroundLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            backgroundLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            backgroundLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
        
        if alignLabel {
            NSLayoutConstraint.activate([
                labelDisplay.centerYAnchor.constraint(equalTo: backgroundLabel.centerYAnchor),
                labelDisplay.leadingAnchor.constraint(equalTo: backgroundLabel.leadingAnchor, constant: 12)
            ])
        } else {
            NSLayoutConstraint.activate([
                labelDisplay.topAnchor.constraint(equalTo: backgroundLabel.topAnchor, constant: 10),
                labelDisplay.leadingAnchor.constraint(equalTo: backgroundLabel.leadingAnchor, constant: 12)
            ])
        }
    }
    
    private func setupShadow() {
        backgroundColor = .clear
        
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowRadius = 2.0
        layer.shadowOpacity = 0.2
    }
    
}
