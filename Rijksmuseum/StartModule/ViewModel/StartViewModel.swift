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
    

    private var page: Int = 1 {
        willSet {
            print(newValue)
        }
        didSet {
            print(oldValue)
        }
    }
    
    func addOnePage() -> Int{
        let newPage = self.page + 1
        self.page = newPage
        return page
    }
 
    func readyToDisplay() {
        view?.displayLoading()
        query()
    }
    
    func reloadData() {
        view?.displayLoading()
        query()
    }
    
    func loadNextPage(){
        
        let endpoint = ArtObjectListAPIEndpoint(numberPage: addOnePage())
    
        NetworkManager.shared.fetch(Query.self, from: endpoint) { [weak self] result in
            DispatchQueue.main.async { [weak self] in
                switch result{
                case .success(let info):
                    print(endpoint)
                    self?.view?.newObjects(newObjets: info.artObjects)
                case .failure(let error):
                    self?.page -= 1
                    print(error.localizedDescription)
                }
            }
        }
    }
}
extension StartViewModel{
    
    func query(){
        
        let endpoint = ArtObjectListAPIEndpoint(numberPage: 1)
        
        NetworkManager.shared.fetch(Query.self, from: endpoint) {[weak self] result in
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                switch result {
                case .success(let info):
                    self?.view?.display(objects:info.artObjects)
                case .failure(let error):
                    self?.view?.displayError()
                    print(error.localizedDescription)
                }
            }
        }
    }
}

