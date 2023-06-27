//
//  StartViewController.swift
//  Rijksmuseum
//
//  Created by Mac on 02.06.2023.
//

import UIKit

class StartViewController: UIViewController {
    
    private let viewModel: StartViewOutput
    
    private var tableView = UITableView()
    private var objects: [ArtObject] = []
    private var activity = UIActivityIndicatorView()
    private var errorView = StartErrorView()
    
    // MARK: - Life Cycle
    
    init(viewModel: StartViewOutput) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupConstraints()
        setupActions()
        
        viewModel.viewDidLoad()
    }
    
    // MARK: - Private Methods
    
    private func setupUI() {
        view.addSubview(activity)
        view.addSubview(tableView)
        view.addSubview(errorView)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.rowHeight = 100
        tableView.backgroundColor = .purple
        tableView.register(ArtObjectTableViewCell.self, forCellReuseIdentifier:"ArtObjectTableViewCell")
        
        tableView.isHidden = true
        errorView.isHidden = true
        activity.isHidden = true
    }
    
    private func setupConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        activity.translatesAutoresizingMaskIntoConstraints = false
        activity.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        activity.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        errorView.translatesAutoresizingMaskIntoConstraints = false
        errorView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        errorView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        errorView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        errorView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
    }
    
    private func setupActions(){
        
        
    }
}

// MARK: - UITableViewDelegate & UITableViewDataSource

extension StartViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        objects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard
            let cell = tableView.dequeueReusableCell(
                withIdentifier: "ArtObjectTableViewCell",
                for: indexPath
            ) as? ArtObjectTableViewCell
        else {
            return UITableViewCell()
        }
        let object = objects[indexPath.row]
        cell.configure(with: object)
        return cell
    }
}
// MARK: - StartViewInput

extension StartViewController: StartViewInput {
    
    func display(objects: [ArtObject]) {
        self.objects = objects
        tableView.isHidden = false
        tableView.reloadData()
    }
    
    func displayError() {
        errorView.isHidden = false
        
    }
    
    func displayLoading() {
        
    }
}

