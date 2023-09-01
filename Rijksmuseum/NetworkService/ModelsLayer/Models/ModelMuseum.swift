//
//  ModelMuseum.swift
//  Rijksmuseum
//
//  Created by Mac on 06.06.2023.
//

import Foundation


struct ArtObjectList: Decodable {
    let artObjects: [ArtObject]
}

struct ArtObject: Decodable {
    let objectNumber: String
    let title: String
    let principalOrFirstMaker: String
    let webImage: WebImage
}

struct WebImage: Decodable {
    let url: String
}
