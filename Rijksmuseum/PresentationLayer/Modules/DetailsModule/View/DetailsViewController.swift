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
        viewModelDeatails.queryDetails()
    }
    
    private func setupUI(){
        view.addSubview(scrollView)
        scrollView.addSubview(stackView)
 
        stackView.axis = .vertical

        stackView.addArrangedSubview(imageObject)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(detailsLabel)
        stackView.spacing = 20
        
        imageObject.image = UIImage(systemName: "lightbulb.circle.fill")
        view.backgroundColor = .systemPurple
        imageObject.backgroundColor = .systemPurple

        //titleLabel.font = UIFont.systemFont(ofSize: 30)
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .center
        titleLabel.adjustsFontSizeToFitWidth = true

        detailsLabel.numberOfLines = 0
        detailsLabel.textAlignment = .left
        detailsLabel.adjustsFontSizeToFitWidth = false
    }
    
    private func setupConstraints(){
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        scrollView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        scrollView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
        
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        stackView.leftAnchor.constraint(equalTo: scrollView.leftAnchor).isActive = true
        stackView.rightAnchor.constraint(equalTo: scrollView.rightAnchor).isActive = true
        stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
  
        imageObject.translatesAutoresizingMaskIntoConstraints = false
        imageObject.heightAnchor.constraint(equalToConstant: 250).isActive = true
    }
}
extension DetailsViewController: DetailsViewInput {
    func display(imageURL: String, tittle: String, info: String) {

        let url = URL(string: imageURL)
        imageObject.kf.setImage(with: url)
        titleLabel.text = tittle
        detailsLabel.text = info
        
    }
}
