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
    lazy var backgroundView: BackgroundView = {
        let backgroundView = BackgroundView(alignLabel: true)
        
        backgroundView.backgroundLabel.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        
        return backgroundView
    }()
    
    lazy var thumbImageView: UIImageView = {
        let thumbDisplay = UIImageView()

        thumbDisplay.clipsToBounds = true
        thumbDisplay.layer.cornerRadius = 20
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
        setupShadow()
        
        addSubview(thumbImageView)
        
        thumbImageView.addSubview(backgroundView)
        
        NSLayoutConstraint.activate([
            thumbImageView.heightAnchor.constraint(equalToConstant: 193),
            thumbImageView.topAnchor.constraint(equalTo: self.topAnchor),
            thumbImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            thumbImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            thumbImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            backgroundView.heightAnchor.constraint(equalToConstant: 52),
            backgroundView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
    
}
