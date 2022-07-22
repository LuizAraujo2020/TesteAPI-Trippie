//
//  HomeViewController.swift
//  Trippie
//
//  Created by Gabriel do Prado Moreira on 17/05/22.
//

import UIKit

class TripsViewController: UIViewController {
    
    //MARK: - Properties
    private let viewModel: TripsViewModel
    
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
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        
        tableView.backgroundColor = UIColor(named: "Blue-1")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: 25))
        
        tableView.register(TripsTableViewCell.self, forCellReuseIdentifier: TripsTableViewCell.cellIdentifier)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        return tableView
    }()
    
    private lazy var alertNewTrip: UIAlertController = {
        let alertController = UIAlertController(title: "New Trip", message: "Enter a city name for this trip.", preferredStyle: .alert)
        
        alertController.addTextField { textField in
            textField.placeholder = "City name"
            textField.clearButtonMode = .whileEditing
            textField.autocapitalizationType = .words
            textField.enablesReturnKeyAutomatically = true
            
            textField.delegate = self
        }
        
        let saveAction = UIAlertAction(title: "Save", style: .default, handler: { [unowned self] alert in
            let cityNameTextField = alertController.textFields![0] as UITextField
            
            viewModel.createNewTrip(city: cityNameTextField.text!)
            
            cityNameTextField.text = nil
        })
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: { alert in
            let cityNameTextField = alertController.textFields![0] as UITextField
            
            cityNameTextField.text = nil
        })
        
        saveAction.isEnabled = false
        
        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)
        
        alertController.preferredAction = saveAction
        
        return alertController
    }()
    
    //MARK: - LifeCycle
    init(viewModel: TripsViewModel = TripsViewModel()) {
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
        
        viewModel.delegate = self
        viewModel.loadTrips()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    //MARK: - Helpers
    private func setupNavigationBar() {
        let editButton = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: nil)
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addCity))
        
        navigationItem.title = "Johnny's Trips"
        navigationItem.setLeftBarButton(editButton, animated: true)
        navigationItem.setRightBarButton(addButton, animated: true)
        
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.backgroundColor = UIColor(named: "Blue-2")
    }
    
    private func setupUI() {
        view.backgroundColor = UIColor(named: "Blue-2")
        
        view.addSubview(backgroundView)
        view.addSubview(moicano)
        view.addSubview(tableView)
        
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
    
    @objc private func addCity() {
        present(alertNewTrip, animated: true)
    }

}

// MARK: Table View Delegate
extension TripsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let tripView = TripViewController()
        
        navigationController?.pushViewController(tripView, animated: true)
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let delete = UIContextualAction(style: .destructive, title: "Delete", handler: { action, view, completionHandler in
            // TODO: - Delete Trip function
        })
        
        return UISwipeActionsConfiguration(actions: [delete])
    }
    
}

extension TripsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TripsTableViewCell.cellIdentifier, for: indexPath) as? TripsTableViewCell else {
            return UITableViewCell()
        }
        
        let trip = viewModel.trips[indexPath.section]
        
        let cityName = trip.city!
        
        cell.thumbView.backgroundView.labelDisplay.text = cityName
        
        if let thumbnailImage = trip.thumbnailImage {
            cell.thumbView.thumbImageView.image = thumbnailImage
        } else {
            viewModel.loadUnsplashData(city: cityName) { response in
                switch response {
                case .success(let thumbString):
                    DispatchQueue.global(qos: .userInteractive).async {
                        let urlThumb = URL(string: thumbString!)!
                        let dataImage = try! Data(contentsOf: urlThumb)
                        let image = UIImage(data: dataImage)
                        
                        DispatchQueue.main.async {
                            cell.thumbView.thumbImageView.image = image
                            trip.thumbnailImage = image
                        }
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.trips.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 193
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
    
}

// - MARK: UITextFieldDelegate
extension TripsViewController: UITextFieldDelegate {
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        let isEmpty = viewModel.textIsEmpty(text: textField.text)
        
        alertNewTrip.preferredAction?.isEnabled = !isEmpty
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let isEmpty = viewModel.textIsEmpty(text: textField.text)
        
        return !isEmpty
    }
    
}

// MARK: TripsViewDelegate
extension TripsViewController: TripsViewDelegate {
    
    func didReloadData() {
        UIView.transition(with: tableView,
                          duration: 0.5,
                          options: .transitionCrossDissolve,
                          animations: { self.tableView.reloadData() })
    }
    
}
