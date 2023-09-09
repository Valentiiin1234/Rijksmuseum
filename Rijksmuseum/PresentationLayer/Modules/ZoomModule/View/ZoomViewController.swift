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
        scrollView.addSubview(imageArt)
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
        
        scrollView.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        scrollView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        scrollView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        
        imageArt.translatesAutoresizingMaskIntoConstraints = false
        imageArt.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        imageArt.heightAnchor.constraint(equalTo: scrollView.heightAnchor).isActive = true
        
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
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        
        if scrollView.zoomScale > 1 {
            if let image = imageArt.image {
                let ratioW = imageArt.frame.width / image.size.width
                let ratioH = imageArt.frame.height / image.size.height
                
                let ratio = ratioW < ratioH ? ratioW : ratioH
                let newWidth = image.size.width * ratio
                let newHeight = image.size.height * ratio
                let conditionLeft = newWidth*scrollView.zoomScale > imageArt.frame.width
                let left = 0.5 * (conditionLeft ? newWidth - imageArt.frame.width : (scrollView.frame.width - scrollView.contentSize.width))
                let conditioTop = newHeight*scrollView.zoomScale > imageArt.frame.height
                
                let top = 0.5 * (conditioTop ? newHeight - imageArt.frame.height : (scrollView.frame.height - scrollView.contentSize.height))
                
                scrollView.contentInset = UIEdgeInsets(top: top, left: left, bottom: top, right: left)   
            } else {
                scrollView.contentInset = .zero
            }
        }
    }
}
