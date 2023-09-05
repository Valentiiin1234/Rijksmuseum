//
//  DetailsViewModel.swift
//  Rijksmuseum
//
//  Created by Mac on 24.07.2023.
//

import Foundation
import UIKit

class DetailsViewModel: DetailsViewOutput {
    
    let artObject: ArtObject
    
    weak var view: DetailsViewInput?
    
    init(artObject: ArtObject) {
        self.artObject = artObject   
    }

    func readyToDisplay() {
        view?.display(imageURL: artObject.webImage.url, tittle: artObject.title, info: "")
    }
    
    
    
    func queryDetails() {
        let endpoint = ArtObjectDetails(id: artObject.objectNumber)
        NetworkManager.shared.fetch(DetailsArtObject.self, from: endpoint) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                    
                case .success(let info):
                    self?.view?.display(imageURL: info.artObject.webImage.url, tittle: info.artObject.title, info: info.artObject.plaqueDescriptionEnglish )
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
}
