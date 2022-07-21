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
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        
        return backgroundView
    }()
    
    private lazy var moicano: UIView = {
        let moicano = UIView()
        
        moicano.backgroundColor = UIColor(named: "Blue-2")
        moicano.layer.cornerRadius = 15
        moicano.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        moicano.translatesAutoresizingMaskIntoConstraints = false
        
        return moicano
    }()
    
    private lazy var departView: BackgroundView = {
        let departView = BackgroundView()
        
        departView.labelDisplay.text = "Depart"
        departView.translatesAutoresizingMaskIntoConstraints = false
        
        return departView
    }()
    
    private lazy var returnView: BackgroundView = {
        let returnView = BackgroundView()
        
        returnView.labelDisplay.text = "Return"
        returnView.translatesAutoresizingMaskIntoConstraints = false
        
        return returnView
    }()
    
    private lazy var plansView: BackgroundView = {
        let plansView = BackgroundView()
        
        plansView.labelDisplay.text = "Plans"
        plansView.translatesAutoresizingMaskIntoConstraints = false
        
        return plansView
    }()
    
    private lazy var listsView: BackgroundView = {
        let listsView = BackgroundView()
        
        listsView.labelDisplay.text = "Lists"
        listsView.translatesAutoresizingMaskIntoConstraints = false
        
        return listsView
    }()
    
    lazy var thumbDisplay: TripThumbView = {
        let thumbDisplay = TripThumbView()
        
        thumbDisplay.translatesAutoresizingMaskIntoConstraints = false
        
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
        
        view.addSubview(departView)
        view.addSubview(returnView)
        view.addSubview(plansView)
        view.addSubview(listsView)
        
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
        
        NSLayoutConstraint.activate([
            departView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            departView.topAnchor.constraint(equalTo: thumbDisplay.bottomAnchor, constant: 25),
            departView.trailingAnchor.constraint(equalTo: returnView.leadingAnchor, constant: -25),
            departView.widthAnchor.constraint(equalTo: returnView.widthAnchor),
            departView.heightAnchor.constraint(equalToConstant: 120),
            departView.centerYAnchor.constraint(equalTo: returnView.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            returnView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            returnView.heightAnchor.constraint(equalTo: departView.heightAnchor)
        ])
        
        NSLayoutConstraint.activate([
            plansView.topAnchor.constraint(equalTo: returnView.bottomAnchor, constant: 25),
            plansView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            plansView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            plansView.heightAnchor.constraint(equalToConstant: 135),
        ])
        
        NSLayoutConstraint.activate([
            listsView.topAnchor.constraint(equalTo: plansView.bottomAnchor, constant: 25),
            listsView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            listsView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            listsView.heightAnchor.constraint(equalToConstant: 135),
        ])
    }
    
}
