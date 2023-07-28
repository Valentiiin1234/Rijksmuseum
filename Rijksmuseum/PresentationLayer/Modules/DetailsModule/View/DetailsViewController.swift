//
//  DetailsViewController.swift
//  Rijksmuseum
//
//  Created by Mac on 24.07.2023.
//

import UIKit

class DetailsViewController: UIViewController {
    private var object: ArtObject!
    private var detailsLabel = UILabel()
    private var imageObject = UIImageView()
    private var titleLabel = UILabel()
    
    private var viewModelDeatails: DetailsViewOutput
    
    init(viewModel: DetailsViewOutput) {
        self.viewModelDeatails = viewModel
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        setupUI()
        setupConstraints()
    }
    
    private func setupUI(){
        view.addSubview(detailsLabel)
        view.addSubview(imageObject)
        view.addSubview(titleLabel)
        
        imageObject.image = UIImage(systemName: "lightbulb.circle.fill")
        view.backgroundColor = .white
        imageObject.backgroundColor = .black
        
        titleLabel.text = "\(object.title)"
        titleLabel.font = UIFont.systemFont(ofSize: 30)
        titleLabel.textAlignment = .center
        titleLabel.adjustsFontSizeToFitWidth = true
        
        detailsLabel.text = "\(object.principalOrFirstMaker)"
        detailsLabel.numberOfLines = 0
        detailsLabel.adjustsFontSizeToFitWidth = true
  
    }
    
    private func setupConstraints(){
        
        imageObject.translatesAutoresizingMaskIntoConstraints = false
        imageObject.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        imageObject.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        imageObject.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16).isActive = true
        imageObject.heightAnchor.constraint(equalToConstant: 250).isActive = true
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: imageObject.bottomAnchor, constant: 16).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true

        detailsLabel.translatesAutoresizingMaskIntoConstraints = false
        detailsLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10).isActive = true
        detailsLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        detailsLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16).isActive = true
        detailsLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -16).isActive = true

    }
}
extension DetailsViewController: DetailsViewInput {
 
    
    
}
