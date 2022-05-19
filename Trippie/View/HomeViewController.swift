//
//  HomeViewController.swift
//  Trippie
//
//  Created by Gabriel do Prado Moreira on 17/05/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    //MARK: - Properties
    let viewModel: HomeViewModel
    
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
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        
        tableView.backgroundColor = UIColor(named: "Blue-1")
        
        tableView.tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: 25))
        
        tableView.register(HomeTableViewCell.self, forCellReuseIdentifier: HomeTableViewCell.cellIdentifier)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        return tableView
    }()
    
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
        
        setupNavigationBar()
        setupUI()
        
        view.backgroundColor = UIColor(named: "Blue-2")
    }
    
    //MARK: - Helpers
    
    private func setupNavigationBar() {
        title = "Hello"
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.backgroundColor = UIColor(named: "Blue-2")
    }
    
    private func setupUI() {
        view.addSubview(backgroundView)
        view.addSubview(moicano)
        view.addSubview(tableView)
        
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        moicano.translatesAutoresizingMaskIntoConstraints = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
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
            tableView.topAnchor.constraint(equalTo: moicano.bottomAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }

}

extension HomeViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

extension HomeViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 25
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return nil
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.cellIdentifier, for: indexPath) as? HomeTableViewCell else {
            return UITableViewCell()
        }
        
        cell.cityLabel.text = "Belo Horizonte"
        
        return cell
    }
    
    
}
