//
//  DetailsModuleAssembly.swift
//  Rijksmuseum
//
//  Created by Mac on 24.07.2023.
//

import Foundation
import UIKit

class DetailsModuleAssembly {
    
    static func buildModule(for object: ArtObject) -> UIViewController {

        let viewModel = DetailsViewModel(artObject: object)
        let view = DetailsViewController(viewModel: viewModel)
        viewModel.view = view
        
        return view
    }
}
