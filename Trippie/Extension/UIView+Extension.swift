//
//  UIView+Extension.swift
//  Trippie
//
//  Created by Johnny Camacho on 21/07/22.
//

import Foundation
import UIKit

extension UIView {
    
    func setupShadow() {
        backgroundColor = .clear
        
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowRadius = 2.0
        layer.shadowOpacity = 0.2
    }
}
