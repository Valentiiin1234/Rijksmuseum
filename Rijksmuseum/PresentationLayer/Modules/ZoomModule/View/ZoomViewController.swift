//
//  ZoomViewController.swift
//  Rijksmuseum
//
//  Created by Mac on 03.09.2023.
//

import Foundation
import Kingfisher
import UIKit


class ZoomViewController: UIViewController {
    
    private var scrollView = UIScrollView()
    private var stackView = UIStackView()
    private let imageArt = UIImageView()
    
    private var viewModel: ZoomViewOutput
    
    init(viewModel: ZoomViewOutput){
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        setupUI()
        setupConstraints()
        viewModel.readyDisplay()
    }

    private func setupUI(){
        view.addSubview(scrollView)
        scrollView.addSubview(stackView)
        stackView.addArrangedSubview(imageArt)

        scrollView.delegate = self
        scrollView.minimumZoomScale = 1
        scrollView.maximumZoomScale = 20
        scrollView.zoomScale = 1
    }
    
    private func setupConstraints(){
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        scrollView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        scrollView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        stackView.leftAnchor.constraint(equalTo: scrollView.leftAnchor).isActive = true
        stackView.rightAnchor.constraint(equalTo: scrollView.rightAnchor).isActive = true
        stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        
        imageArt.translatesAutoresizingMaskIntoConstraints = false
        imageArt.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
    }
}

extension ZoomViewController: ZoomViewInput {
    func display(imageURL: String) {
        let url = URL(string: imageURL)
        imageArt.kf.setImage(with: url)
    }
}

extension ZoomViewController: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageArt
    }
}


