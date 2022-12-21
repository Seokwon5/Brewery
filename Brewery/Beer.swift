//
//  Beer.swift
//  Brewery
//
//  Created by 이석원 on 2022/12/17.
//

import Foundation

struct Beer: Decodable {
    let id : Int?
    let name, taglineString, description, brewersTips, imageURL : String?
    let foodPairing : [String]?
    
    var tagLine: String {
        let tags = taglineString?.components(separatedBy: ". ")
        let hashtags = tags?.map {
            "#" + $0.replacingOccurrences(of: " ", with: "")
                .replacingOccurrences(of: ".", with: "")
                .replacingOccurrences(of: ",", with: " #")
        }
        return hashtags?.joined(separator: " ") ?? ""
    }
    
    enum CodingKeys: String, CodingKey {
        case id, name, description
        case taglineString = "tagline"
        case brewersTips = "brewers_tips"
        case imageURL = "image_url"
        case foodPairing = "food_pairing"
    }
    
}
