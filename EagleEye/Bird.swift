//
//  Bird.swift
//  EagleEye
//
//  Created by Dylan Sharp on 11/7/22.
//

import Foundation

class Bird: Codable {
    let comName: String
    let sciName: String
    let obsDt: Date
    let locName: String
    let lat: Double
    let lng: Double
    
    
    
    enum CodingKeys: String, CodingKey {
        case comName
        case sciName
        case obsDt
        case locName
        case lat
        case lng
    }
}

extension Bird: Equatable {
    static func == (lhs: Bird, rhs: Bird) -> Bool {
        return lhs.comName == rhs.comName
    }
}
