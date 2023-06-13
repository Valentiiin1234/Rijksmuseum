//
//  ArtObjectTableViewCell.swift
//  Rijksmuseum
//
//  Created by Mac on 02.06.2023.
//

import UIKit

class ArtObjectTableViewCell: UITableViewCell {
    
    //let artImageView = UIImageView()
   // let artTitleLabel = UILabel()
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        //setupView()
        //setupConstraints()
        
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - setupConstraints

//extension ArtObjectTableViewCell {
//
//    func setupConstraints() {
//
//        artImageView.translatesAutoresizingMaskIntoConstraints = false
//        artImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
//        artImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 12).isActive = true
//        artImageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
//        artImageView.widthAnchor.constraint(equalTo: artImageView.heightAnchor, multiplier: 1 / 1).isActive = true
//
//        artTitleLabel.translatesAutoresizingMaskIntoConstraints = false
//        artTitleLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
//        artTitleLabel.leftAnchor.constraint(equalTo: artImageView.rightAnchor, constant: 20).isActive = true
//        artTitleLabel.heightAnchor.constraint(equalToConstant: 80).isActive = true
//        artTitleLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -12).isActive = true
//    }
//    // MARK: - setupView
//
//    func setupView() {
//
//        contentView.addSubview(artImageView)
//        contentView.addSubview(artTitleLabel)
//    }
//
//
//
//}
