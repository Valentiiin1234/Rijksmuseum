//
//  NetworkManager.swift
//  Rijksmuseum
//
//  Created by Mac on 06.06.2023.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}


class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    private let baseURL = "https://www.rijksmuseum.nl/api/en"
    private let key = "GDvO2VdC"
    
    func fetch<T: Decodable>(_ type: T.Type, from endpoint: APIEndpoint, completion: @escaping(Result<T, NetworkError>) -> Void) {
        
        let params = endpoint.parameters.map { key, value in
            "\(key)=\(value)"
        }
        
        //https://www.rijksmuseum.nl/api/en/collection?key=GDvO2VdC&p=3&ps=50
        let query = params.joined(separator: "&")
        
        guard let url = URL(string: "\(baseURL)\(endpoint.path)?key=\(key)&\(query)") else {
            print("\(baseURL)\(endpoint)?key=\(key)&\(query)")
            completion(.failure(.invalidURL))
            return
        }
        
        
        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method
        
        URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data else {
                completion(.failure(.noData))
                return
            }
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let type = try decoder.decode(T.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(type))
                }
            }catch {
                completion(.failure(.decodingError))
            }
        }.resume()
    }
}


protocol APIEndpoint {
    
    var path: String { get }
    var method: String { get }
    var parameters: [String : String] { get }
    
}

struct ArtObjectListAPIEndpoint: APIEndpoint {
    
    var path = "/collection"
    var method = "GET"
    var parameters: [String : String]
    
    init(numberPage: Int, objectsCount: Int = .artObjectsPerPage) {
        parameters = [
            "ps" : "\(objectsCount)",
            "p" : "\(numberPage)"
        ]
    }
}

extension Int {
    
    static let artObjectsPerPage: Int = 50
    
}


// https://www.rijksmuseum.nl/api/en/collection/SK-C-5?key=GDvO2VdC


