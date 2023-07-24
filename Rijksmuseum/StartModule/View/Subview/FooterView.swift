//
//  FooterView.swift
//  Rijksmuseum
//
//  Created by Mac on 17.07.2023.
//

import UIKit



class FooterView: UIView {

    private var loadButton = UIButton()
    private var loadLabel = UILabel()
 
    var onTapLoad: (() -> Void)?
    
    weak var delegate: FooterViewDeleagte?
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupUI()
        setupConstraints()
        setupAction()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI(){
        addSubview(loadButton)
        addSubview(loadLabel)
        
        backgroundColor = .white
        frame.size.height = 60
        
        loadLabel.text = "LOADING..."
        loadLabel.textAlignment = .center
        
        loadButton.setTitle("LOAD MORE", for: .normal)
        loadButton.backgroundColor = .blue
        loadButton.layer.cornerRadius = 15
        loadButton.setTitleColor(.white, for: .normal)
    }
    func setupConstraints(){
        loadButton.translatesAutoresizingMaskIntoConstraints = false
        loadButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        loadButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        loadButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -80).isActive = true
        loadButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 80).isActive = true
        
        loadLabel.translatesAutoresizingMaskIntoConstraints = false
        loadLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        loadLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        loadLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -80).isActive = true
        loadLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 80).isActive = true
        
    }
    
    func setupAction(){
        loadButton.addTarget(self, action: #selector(loadButtonAction), for: .touchUpInside)
    }
    
    @objc
    private func loadButtonAction(){
        onTapLoad?()
    }
}

extension FooterView: FooterViewDeleagte {
    func noData() {
        loadButton.isHidden = true
        loadLabel.isHidden = true
    }
    
    
}

