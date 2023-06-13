//
//  StartViewController.swift
//  Rijksmuseum
//
//  Created by Mac on 02.06.2023.
//

import UIKit

class StartViewController: UIViewController {
    
    let viewModel: StartViewModel!
    
    var tableView = UITableView()
    var objects: [ArtObject] = []
    var activity = UIActivityIndicatorView()
    
    var imageError = UIImageView()
    var buttonError = UIButton()
    
    
    init(viewModel: StartViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(activity)
        activity.startAnimating()
        tableView.isHidden = true
        configureTableView()
        tableView.backgroundColor = .purple
        viewModel.viewDidLoad()
   
    }
    
    // MARK: - Confifgure TableView
    func configureTableView() {
        
        view.addSubview(tableView)
        setupConstraints()
        setTableViewDelegates()
        tableView.rowHeight = 100
        tableView.register(ArtObjectTableViewCell.self, forCellReuseIdentifier:"ArtObjectTableViewCell")
        
        
    }
    
    // MARK: - Data and Source TableView
    func setTableViewDelegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension StartViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        objects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArtObjectTableViewCell", for: indexPath)
        let object = objects[indexPath.row]
        
        var content = cell.defaultContentConfiguration()
        content.text = object.title
        content.secondaryText = object.principalOrFirstMaker
        content.image = UIImage(systemName: "camera.on.rectangle")
        content.imageProperties.reservedLayoutSize.height = 80
        content.imageProperties.reservedLayoutSize.width = 80
        
        cell.contentConfiguration = content
        
        return cell
    }
    
    func setupConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        activity.translatesAutoresizingMaskIntoConstraints = false
        activity.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        activity.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        
        
    }
}

extension StartViewController {
    
    func display() {
        
        activity.stopAnimating()
        activity.isHidden = true// вывести необходимую вью
        
        tableView.isHidden = false
        tableView.reloadData()
   
    }
    
    func displayError() {
        setErrorDisplay()
        activity.stopAnimating()
        activity.isHidden = true
        tableView.isHidden = true
        view.backgroundColor = .black
    }
    
    func setErrorDisplay() {
        view.addSubview(imageError)
        view.addSubview(buttonError)
        setConstraintsErrorDisplay()
        
        imageError.image = UIImage(systemName: "play.slash.fill")
        buttonError.tintColor = .purple
    }
    
    
    func setConstraintsErrorDisplay(){
        imageError.translatesAutoresizingMaskIntoConstraints = false
        imageError.widthAnchor.constraint(equalToConstant: 80).isActive = true
        imageError.heightAnchor.constraint(equalToConstant: 80).isActive = true
        imageError.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageError.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        buttonError.translatesAutoresizingMaskIntoConstraints = false
        buttonError.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 16).isActive = true
        buttonError.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 16).isActive = true
        buttonError.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        buttonError.widthAnchor.constraint(equalToConstant: 30).isActive = true
  
    }

    //    func fetchObjects(){
    //
    //        let endpoint = ArtObjectListAPIEndpoint(numberPage: 1)
    //        // активити инликатор
    //
    //
    //        NetworkManager.shared.fetch(Query.self, from: endpoint) {[weak self] result in
    //
    //            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
    //                switch result {
    //                case .success(let info):
    //                    self?.objects = info.artObjects
    //                    self?.tableView.isHidden = false
    //                    self?.tableView.reloadData()
    //                case .failure(let error):
    //                    self?.tableView.isHidden = true
    //                    print(error.localizedDescription)
    //                }
    //            }
    //        }
    //    }
}
