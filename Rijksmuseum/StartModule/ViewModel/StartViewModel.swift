//
//  StartViewModel.swift
//  Rijksmuseum
//
//  Created by Mac on 12.06.2023.
//

import Foundation
import UIKit

class StartViewModel {
    
    
    
    weak var view: StartViewController!
    
    func viewDidLoad() {
        
        let endpoint = ArtObjectListAPIEndpoint(numberPage: 1)
        // активити инликатор
        
        NetworkManager.shared.fetch(Query.self, from: endpoint) {[weak self] result in
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                switch result {
                case .success(let info):
                    self?.view.objects = info.artObjects
                    self?.view.display()
                case .failure(let error):
                    self?.view.displayError()
                    print(error.localizedDescription)
                }
            }
        }
    }
    
}
