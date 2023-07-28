//
//  DetailsModuleAssembly.swift
//  Rijksmuseum
//
//  Created by Mac on 24.07.2023.
//

import Foundation
import UIKit

class DetailsModuleAssembly {
    
    static func buildModule() -> UIViewController {

        let viewModel = DetailsViewModel()
        let view = DetailsViewController(viewModel: viewModel)
        viewModel.viewDetails = view
        
        return view
    }
}
