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
    lazy var backgroundLabel: BackgroundView = {
        let backgroundLabel = BackgroundView(alignLabel: true)
        
        backgroundLabel.backgroundLabel.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        backgroundLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return backgroundLabel
    }()
    
    lazy var thumbDisplay: UIImageView = {
        let thumbDisplay = UIImageView()

        thumbDisplay.image = UIImage(named: "PlaceholderCity")
        thumbDisplay.translatesAutoresizingMaskIntoConstraints = false

        return thumbDisplay
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
        addSubview(thumbDisplay)
        
        thumbDisplay.addSubview(backgroundLabel)
        
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
    }
    
}
