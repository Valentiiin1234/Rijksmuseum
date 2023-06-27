//
//  ArtObjectTableViewCell.swift
//  Rijksmuseum
//
//  Created by Mac on 02.06.2023.
//

import UIKit
import Kingfisher

class ArtObjectTableViewCell: UITableViewCell {
    
    let artImageView = UIImageView()
    let artTitleLabel = UILabel()
// MARK: - Life Cycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with object: ArtObject) {
        artTitleLabel.text = "\(object.title)"
        
        
        let url = URL(string: "\(object.webImage.url)")
        let processor = DownsamplingImageProcessor(size: artImageView.bounds.size)
        artImageView.kf.indicatorType = .activity
        artImageView.kf.setImage(
            with: url,
            placeholder: UIImage(named: "placeholderImage"),
            options: [
                .processor(processor),
                .scaleFactor(UIScreen.main.scale),
                .transition(.fade(1)),
                .cacheOriginalImage
            ])
        {
            result in
            switch result {
            case .success(let value):
                print("Task done for: \(value.source.url?.absoluteString ?? "")")
            case .failure(let error):
                print("Job failed: \(error.localizedDescription)")
            }
        }
    }
}

// MARK: - setupUI & setupConstraints

extension ArtObjectTableViewCell {
    
    func setupCell() {
        
        contentView.addSubview(artImageView)
        contentView.addSubview(artTitleLabel)
        
    }
    
    func setupConstraints() {
        
        artImageView.translatesAutoresizingMaskIntoConstraints = false
        artImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        artImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 12).isActive = true
        artImageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        artImageView.widthAnchor.constraint(equalTo: artImageView.heightAnchor, multiplier: 1 / 1).isActive = true
        
        artTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        artTitleLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        artTitleLabel.leftAnchor.constraint(equalTo: artImageView.rightAnchor, constant: 20).isActive = true
        artTitleLabel.heightAnchor.constraint(equalToConstant: 80).isActive = true
        artTitleLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -12).isActive = true
        
    }
}
