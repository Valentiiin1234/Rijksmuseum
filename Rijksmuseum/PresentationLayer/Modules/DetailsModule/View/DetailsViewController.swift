//
//  DetailsViewController.swift
//  Rijksmuseum
//
//  Created by Mac on 24.07.2023.
//
import Kingfisher
import UIKit

class DetailsViewController: UIViewController {
    
    private var scrollView = UIScrollView()
    private var stackView = UIStackView()
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
        
        viewModelDeatails.readyToDisplay()
    }
    
    private func setupUI(){
        view.addSubview(scrollView)
        scrollView.addSubview(stackView)
        
        
        stackView.axis = .vertical

        stackView.addSubview(detailsLabel)
        stackView.addSubview(imageObject)
        stackView.addSubview(titleLabel)
        
        imageObject.image = UIImage(systemName: "lightbulb.circle.fill")
        view.backgroundColor = .systemPurple
        imageObject.backgroundColor = .systemPurple

        titleLabel.font = UIFont.systemFont(ofSize: 30)
        titleLabel.textAlignment = .center
        titleLabel.adjustsFontSizeToFitWidth = true

        detailsLabel.numberOfLines = 0
        detailsLabel.adjustsFontSizeToFitWidth = true
  
    }
    
    private func setupConstraints(){
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        scrollView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        scrollView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        stackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        stackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
        
        
        
        imageObject.translatesAutoresizingMaskIntoConstraints = false
        imageObject.topAnchor.constraint(equalTo: stackView.topAnchor, constant: 10).isActive = true
        imageObject.leftAnchor.constraint(equalTo: stackView.leftAnchor, constant: 10).isActive = true
        imageObject.rightAnchor.constraint(equalTo: stackView.rightAnchor, constant: -10).isActive = true
        imageObject.heightAnchor.constraint(equalToConstant: 250).isActive = true

        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: imageObject.bottomAnchor, constant: 10).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: stackView.leftAnchor, constant: 10).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: stackView.rightAnchor, constant: 10).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 80).isActive = true

        detailsLabel.translatesAutoresizingMaskIntoConstraints = false
        detailsLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10).isActive = true
        detailsLabel.leftAnchor.constraint(equalTo: stackView.leftAnchor, constant: 10).isActive = true
        detailsLabel.rightAnchor.constraint(equalTo: stackView.rightAnchor, constant: -10).isActive = true
        detailsLabel.bottomAnchor.constraint(equalTo: stackView.bottomAnchor, constant: -10).isActive = true

    }
}
extension DetailsViewController: DetailsViewInput {
    func display(imageURL: String, tittle: String, info: String) {

        let url = URL(string: imageURL)
        imageObject.kf.setImage(with: url)
        titleLabel.text = tittle
    }

    
 
    
 
    
    
}
