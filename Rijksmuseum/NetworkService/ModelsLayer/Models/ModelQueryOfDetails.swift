//
//  QueryOfDetails.swift
//  Rijksmuseum
//
//  Created by Mac on 24.07.2023.
//

import Foundation

struct DetailsArtObject: Decodable {
    let artObject: Details
}

struct Details: Decodable{
    let title: String
    let webImage: WebImageObject
    let plaqueDescriptionEnglish: String
}
struct WebImageObject: Decodable{
    let url: String
}
