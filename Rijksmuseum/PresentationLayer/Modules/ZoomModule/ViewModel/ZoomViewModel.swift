//
//  ZoomViewModel.swift
//  Rijksmuseum
//
//  Created by Mac on 03.09.2023.
//

import Foundation
import UIKit

class ZoomViewModel {
    
    let url: String
    
    weak var view: ZoomViewInput?
    
    init(url: String) {
        self.url = url
    }
}
extension ZoomViewModel: ZoomViewOutput {
    
    func readyDisplay() {
        view?.display(imageURL: url)
    }
    
    
}
