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
    private var buttonClose = UIButton()
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    private var viewModel: ZoomViewOutput
    
    init(viewModel: ZoomViewOutput){
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        modalPresentationStyle = .fullScreen
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        setupUI()
        setupConstraints()
        setupActiion()
        viewModel.readyDisplay()
    }
    
    private func setupUI(){
        view.addSubview(scrollView)
        scrollView.addSubview(stackView)
        stackView.addArrangedSubview(imageArt)
        view.addSubview(buttonClose)
        
        scrollView.delegate = self
        scrollView.minimumZoomScale = 1
        scrollView.maximumZoomScale = 3
        scrollView.zoomScale = 1
        imageArt.contentMode = .scaleAspectFit
        buttonClose.setTitle("close", for: .normal)
        view.backgroundColor = .black
        
      
        
    }
    
    private func setupConstraints(){
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        scrollView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        scrollView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        scrollView.widthAnchor.constraint(equalToConstant: view.bounds.width).isActive = true
        scrollView.heightAnchor.constraint(equalToConstant: view.bounds.height).isActive = true
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
 
        stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        stackView.heightAnchor.constraint(equalTo: scrollView.heightAnchor).isActive = true
        stackView.leftAnchor.constraint(equalTo: scrollView.leftAnchor).isActive = true
        stackView.rightAnchor.constraint(equalTo: scrollView.rightAnchor).isActive = true
        
        imageArt.translatesAutoresizingMaskIntoConstraints = false
        imageArt.centerYAnchor.constraint(equalTo: stackView.centerYAnchor).isActive = true
        imageArt.centerXAnchor.constraint(equalTo: stackView.centerXAnchor).isActive = true

        imageArt.widthAnchor.constraint(equalToConstant: view.bounds.width).isActive = true
        
        buttonClose.translatesAutoresizingMaskIntoConstraints = false
        buttonClose.topAnchor.constraint(equalTo: view.topAnchor, constant: 60).isActive = true
        buttonClose.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true

    }
    private func setupActiion(){
        buttonClose.addTarget(self, action: #selector(closeZoomVC), for: .touchUpInside)
    }
    
    @objc func closeZoomVC(){
        dismiss(animated: true)
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


