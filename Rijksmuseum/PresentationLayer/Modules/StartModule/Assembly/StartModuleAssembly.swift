//
//  StartModuleAssembly.swift
//  Rijksmuseum
//
//  Created by Mac on 12.06.2023.
//

import Foundation
import UIKit

class StartModuleAssembly {
    
    static func buildModule() -> UIViewController {
        let viewModel = StartViewModel()
        let view = StartViewController(viewModel: viewModel)
        viewModel.view = view
        
        return view
    }
}
