//
//  TripViewController.swift
//  Trippie
//
//  Created by Johnny Camacho on 20/05/22.
//

import Foundation
import UIKit

class TripViewController: UIViewController {
    
    //MARK: - Properties
    private lazy var backgroundView: UIView = {
        let backgroundView = UIView()
        
        backgroundView.backgroundColor = UIColor(named: "Blue-1")
        
        return backgroundView
    }()
    
    private lazy var moicano: UIView = {
        let moicano = UIView()
        
        moicano.backgroundColor = UIColor(named: "Blue-2")
        moicano.layer.cornerRadius = 15
        moicano.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        
        return moicano
    }()
    
    lazy var thumbDisplay: TripThumbView = {
        let thumbDisplay = TripThumbView()
        
        return thumbDisplay
    }()
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        setupUI()
    }
    
    //MARK: - Helpers
    private func setupNavigationBar() {
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: nil)
        
        navigationItem.title = "Trip"
        navigationItem.setRightBarButton(doneButton, animated: true)
        
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.backgroundColor = UIColor(named: "Blue-2")
    }
    
    private func setupUI() {
        view.backgroundColor = UIColor(named: "Blue-2")
        
        view.addSubview(backgroundView)
        view.addSubview(moicano)
        
        view.addSubview(thumbDisplay)
        
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        moicano.translatesAutoresizingMaskIntoConstraints = false
        thumbDisplay.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            moicano.heightAnchor.constraint(equalToConstant: 18),
            moicano.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            moicano.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            moicano.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            thumbDisplay.topAnchor.constraint(equalTo: moicano.bottomAnchor, constant: 25),
            thumbDisplay.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            thumbDisplay.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
    
}
