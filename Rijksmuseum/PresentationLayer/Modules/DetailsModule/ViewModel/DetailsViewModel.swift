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
    
    weak var viewDetails: DetailsViewInput?
    init(artObject: ArtObject) {
        self.artObject = artObject
        
    }

    func readyToDisplay() {
        viewDetails?.display(imageURL: artObject.webImage.url, tittle: artObject.title, info: artObject.principalOrFirstMaker)
    }
}
