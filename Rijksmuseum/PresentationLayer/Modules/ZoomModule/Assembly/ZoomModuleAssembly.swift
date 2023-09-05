//
//  ZoomModuleAssembly.swift
//  Rijksmuseum
//
//  Created by Mac on 03.09.2023.
//

import Foundation
import UIKit

class ZoomModuleAssembly {
    static func buildModule(for url: String) -> UIViewController {
        
        let viewModel = ZoomViewModel(url: url)
        let view = ZoomViewController(viewModel: viewModel)
        viewModel.view = view
        return view
        
    }
}

