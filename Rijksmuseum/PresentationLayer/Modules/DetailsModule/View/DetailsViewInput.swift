//
//  DetailsViewInput.swift
//  Rijksmuseum
//
//  Created by Mac on 24.07.2023.
//

import Foundation


protocol DetailsViewInput: AnyObject {
    func display(imageURL: String, tittle: String, info: String)
    
}
