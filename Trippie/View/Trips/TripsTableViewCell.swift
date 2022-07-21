//
//  HomeTableViewCell.swift
//  Trippie
//
//  Created by Johnny Camacho on 19/05/22.
//

import Foundation
import UIKit

class TripsTableViewCell: UITableViewCell {
    
    //MARK: - Properties
    static let cellIdentifier = "TripsCells"
    
    lazy var thumbDisplay: TripThumbView = {
        let thumbDisplay = TripThumbView()
        
        thumbDisplay.translatesAutoresizingMaskIntoConstraints = false

        return thumbDisplay
    }()
    
    //MARK: - LifeCycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        setupUI()
        
        layer.masksToBounds = false
    }
    
    //MARK: - Helpers
    private func setupUI() {
        setupUICell()
        
        contentView.addSubview(thumbDisplay)
        
        NSLayoutConstraint.activate([
            thumbDisplay.topAnchor.constraint(equalTo: contentView.topAnchor),
            thumbDisplay.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            thumbDisplay.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            thumbDisplay.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
    
    private func setupUICell() {
        backgroundColor = .clear
        selectionStyle = .none
    }
    
}
