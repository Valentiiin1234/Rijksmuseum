//
//  StartViewInput.swift
//  Rijksmuseum
//
//  Created by Mac on 25.06.2023.
//

import Foundation

protocol StartViewInput: AnyObject {
    
    func display(objects: [ArtObject])
    func displayError()
    func displayLoading()
}
