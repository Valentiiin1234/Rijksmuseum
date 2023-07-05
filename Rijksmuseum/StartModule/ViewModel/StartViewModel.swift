//
//  StartViewModel.swift
//  Rijksmuseum
//
//  Created by Mac on 12.06.2023.
//

import Foundation
import UIKit

class StartViewModel: StartViewOutput {
    
    weak var view: StartViewInput?
    
    func reloadData() {
        view?.displayLoading()
        query()
    }
    
    func readyToDisplay() {
        view?.displayLoading()
        query()
    }
}

extension StartViewModel{
    
    @objc func query(){
        
        let endpoint = ArtObjectListAPIEndpoint(numberPage: 1)
        
        NetworkManager.shared.fetch(Query.self, from: endpoint) {[weak self] result in
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                switch result {
                case .success(let info):
                    self?.view?.display(objects: info.artObjects)
                case .failure(let error):
                    self?.view?.displayError()
                    print(error.localizedDescription)
                }
            }
        }
    }
}
