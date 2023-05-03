//
//  BirdStore.swift
//  EagleEye
//
//  Created by Dylan Sharp on 11/7/22.
//

import UIKit

enum BirdError: Error {
    case imageCreationError
    case missingImageURL
}

class BirdStore {
    private let session: URLSession = {
        let config = URLSessionConfiguration.default
        return URLSession(configuration: config)
    }()
    
    func fetchBirds(completion: @escaping (Result<[Bird], Error>) -> Void) {
        let countryCode = NSLocale.current.regionCode
        let url = "https://api.ebird.org/v2/data/obs/"+countryCode!+"/recent"
        print(url)
        var components = URLComponents(string: url)!
        var queryItems: [URLQueryItem] = [URLQueryItem(name: "maxResults", value: "100")]
        components.queryItems = queryItems
        var request = URLRequest(url: components.url!)
        request.addValue(EBirdAPI.apiKey, forHTTPHeaderField: "X-eBirdApiToken")
        let task = session.dataTask(with: request) {
            (data, request, error) in
            
            let result = self.processBirdRequest(data: data, error: error)
            OperationQueue.main.addOperation{completion(result)}
        }
        task.resume()
    }
    
    private func processBirdRequest(data: Data?, error: Error?) -> Result<[Bird], Error> {
        guard let jsonData = data else {
            return .failure(error!)
        }
        
        return EBirdAPI.birds(fromJSON: jsonData)
    }
}

