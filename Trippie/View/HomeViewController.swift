//
//  HomeViewController.swift
//  Trippie
//
//  Created by Gabriel do Prado Moreira on 17/05/22.
//

import UIKit

class HomeViewController: UIViewController {
    //MARK: - Properties
    var viewModel: HomeViewModel
    
    //MARK: - LifeCycle
    init(viewModel: HomeViewModel = HomeViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        viewModel.loadUnsplashData()
    }
    
    //MARK: - Helpers

}
