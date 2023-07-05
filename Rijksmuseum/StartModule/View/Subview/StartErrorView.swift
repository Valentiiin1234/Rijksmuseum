//
//  StartErrorView.swift
//  Rijksmuseum
//
//  Created by Mac on 27.06.2023.
//

import UIKit

class StartErrorView: UIView {
    
    private let imageError = UIImageView()
    let buttonError = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupUI()
        setupConstraints()
        setupActions()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Private Methods

extension StartErrorView {
    
    private func setupUI() {
        addSubview(imageError)
        addSubview(buttonError)
        
        imageError.image = UIImage(systemName: "play.slash.fill")
        
        buttonError.backgroundColor = .blue
        buttonError.layer.cornerRadius = 15
        buttonError.setTitle("RELOAD", for: .normal)
        buttonError.setTitleColor(.white, for: .normal)
        
        
    }
    
    private func setupConstraints() {
        
        imageError.translatesAutoresizingMaskIntoConstraints = false
        imageError.widthAnchor.constraint(equalToConstant: 80).isActive = true
        imageError.heightAnchor.constraint(equalToConstant: 80).isActive = true
        imageError.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        imageError.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        buttonError.translatesAutoresizingMaskIntoConstraints = false
        buttonError.topAnchor.constraint(equalTo: imageError.topAnchor, constant: 120).isActive = true
        buttonError.rightAnchor.constraint(equalTo: rightAnchor, constant: -80).isActive = true
        buttonError.leftAnchor.constraint(equalTo: leftAnchor, constant: 80).isActive = true
        
    }
    
    private func setupActions() {
       
    }

}

