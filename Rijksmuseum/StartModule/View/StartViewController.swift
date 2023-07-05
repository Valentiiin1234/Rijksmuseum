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
    private var footer = UIView()
    private var loadButton = UIButton()
    private var numberPage = 1

    
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
        
        viewModel.readyToDisplay()
    }
    
    // MARK: - Private Methods
    
    private func setupUI() {
        view.addSubview(activity)
        view.addSubview(tableView)
        view.addSubview(errorView)
        footer.addSubview(loadButton)
    
        tableView.tableFooterView = footer
        footer.backgroundColor = .white
        footer.frame.size.height = 60
        footer.frame.size.width = view.frame.size.width
        
        loadButton.setTitle("LOAD MORE", for: .normal)
        loadButton.setTitle("Loading...", for: .highlighted)
        loadButton.backgroundColor = .blue
        loadButton.layer.cornerRadius = 15
        loadButton.setTitleColor(.white, for: .normal)
        
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
        
        loadButton.translatesAutoresizingMaskIntoConstraints = false
        loadButton.centerXAnchor.constraint(equalTo: footer.centerXAnchor).isActive = true
        loadButton.centerYAnchor.constraint(equalTo: footer.centerYAnchor).isActive = true
        loadButton.rightAnchor.constraint(equalTo: footer.rightAnchor, constant: -80).isActive = true
        loadButton.leftAnchor.constraint(equalTo: footer.leftAnchor, constant: 80).isActive = true
       
    }
    
    private func setupActions(){
        
        errorView.buttonError.addTarget(self, action: #selector(onTap), for: .touchUpInside)
        loadButton.addTarget(self, action: #selector(onTapLoadButton), for: .touchUpInside)
    }
    
    @objc func onTap(){
        viewModel.reloadData()
    }
    
    @objc func onTapLoadButton(){
        
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
        errorView.isHidden = true
        activity.stopAnimating()
        activity.isHidden = true
        self.objects = objects
        tableView.isHidden = false
        tableView.reloadData()
    }
    
    func displayError() {
        activity.stopAnimating()
        tableView.isHidden = true
        activity.isHidden = true
        errorView.isHidden = false
        
    }
    
    func displayLoading() {
        tableView.isHidden = true
        errorView.isHidden = true
        activity.isHidden = false
        activity.startAnimating()
    }
}

