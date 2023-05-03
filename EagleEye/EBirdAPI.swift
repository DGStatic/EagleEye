//
//  EBirdAPI.swift
//  EagleEye
//
//  Created by Dylan Sharp on 11/7/22.
//

import Foundation

struct EBirdAPI {
    
    
    static var baseURL: String = "https://api.ebird.org/v2/data/obs/US/recent"
    static let apiKey = "51e6co3oi5g0"
    
    
    static func birds(fromJSON data: Data) -> Result<[Bird], Error> {
        do {
            let decoder = JSONDecoder()
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
            dateFormatter.locale = Locale(identifier: "en_US_POSIX")
            dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
            decoder.dateDecodingStrategy = .formatted(dateFormatter)
            

            
            let eBirdResponse: [Bird] = try decoder.decode([Bird].self, from: data)
            let birds = eBirdResponse
            return .success(birds)
        } catch {
            return .failure(error)
        }
    }
}



