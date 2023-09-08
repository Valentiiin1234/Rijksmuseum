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
    private var imageURL: String!
    
    private var detailsLabel = UILabel()
    private var imageObject = UIImageView()
    private var titleLabel = UILabel()
 
    private var viewModel: DetailsViewOutput
    
    init(viewModel: DetailsViewOutput) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        setupUI()
        setupConstraints()
        setupAction()
        viewModel.readyToDisplay()
        viewModel.queryDetails()
    }

    private func setupUI(){
        view.addSubview(scrollView)
        scrollView.addSubview(stackView)
 
        stackView.axis = .vertical

        stackView.addArrangedSubview(imageObject)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(detailsLabel)
        stackView.spacing = 20

        view.backgroundColor = .white
        imageObject.backgroundColor = .white

        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .center
        titleLabel.adjustsFontSizeToFitWidth = false
        
        detailsLabel.numberOfLines = 0
        detailsLabel.textAlignment = .left
        detailsLabel.adjustsFontSizeToFitWidth = false
    }
    
    private func setupAction(){
        imageObject.isUserInteractionEnabled = true
        let singleTap = UITapGestureRecognizer()
        singleTap.numberOfTapsRequired = 1
        singleTap.addTarget(self, action: #selector(self.tapImage))
        imageObject.addGestureRecognizer(singleTap)
    }
 
    
    @objc func tapImage(){
        present(ZoomModuleAssembly.buildModule(for: imageURL), animated: true)
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
        self.imageURL = imageURL
        let url = URL(string: imageURL)
        imageObject.kf.setImage(with: url)
        titleLabel.text = tittle
        detailsLabel.text = info
    } 
}

