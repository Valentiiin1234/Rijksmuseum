//
//  FooterView.swift
//  Rijksmuseum
//
//  Created by Mac on 17.07.2023.
//

import UIKit

//FooterView
//- Button "LOAD MORE"
//- Label "LOADING..."
//- Label "NO DATA"


extension FooterView {
    
    enum State {
        
        case loadMore
        case loading
        case noData
        
    }
    
}

class FooterView: UIView {

    private var loadButton = UIButton()
    private var loadingLabel = UILabel()
    private var noDataLabel = UILabel()
 
    var onTapLoad: (() -> Void)?
    
    var state: State = .loadMore {
        didSet {
            setupUIByState()
        }
    }
    
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
        setupUIByState()
        
        addSubview(loadButton)
        addSubview(loadingLabel)
        addSubview(noDataLabel)
        
        backgroundColor = .white
        frame.size.height = 60
        
        loadingLabel.text = "LOADING..."
        loadingLabel.textAlignment = .center
        
        noDataLabel.text = "END OF PAGES"
        noDataLabel.textAlignment = .center
        
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
        
        loadingLabel.translatesAutoresizingMaskIntoConstraints = false
        loadingLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        loadingLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        loadingLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -80).isActive = true
        loadingLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 80).isActive = true
        
        noDataLabel.translatesAutoresizingMaskIntoConstraints = false
        noDataLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        noDataLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        noDataLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -80).isActive = true
        noDataLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 80).isActive = true
    }
    
    func setupUIByState() {
        switch state {
        case .loadMore:
            loadButton.isHidden = false
            loadingLabel.isHidden = true
            noDataLabel.isHidden = true
            
        case .loading:
            loadButton.isHidden = true
            loadingLabel.isHidden = false
            noDataLabel.isHidden = true
            
        case .noData:
            loadButton.isHidden = true
            loadingLabel.isHidden = true
            noDataLabel.isHidden = false
        }
    }
    
    func setupAction(){
        loadButton.addTarget(self, action: #selector(loadButtonAction), for: .touchUpInside)
    }
    
    @objc
    private func loadButtonAction(){
        onTapLoad?()
    }
}
