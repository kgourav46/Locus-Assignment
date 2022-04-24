//
//  APIConstants.swift
//  Assignment
//
//  Created by Mac Pro on 24/04/22.
//  Copyright © 2022 Gourav. All rights reserved.
//

import UIKit

struct APIConstants {
    static let BASEURL = "https://api.openweathermap.org"
    static let VERSION = BASEURL + "/data/2.5/"
    static let IMAGE_BASE_URL = "http://openweathermap.org/img/wn/"
}

struct APIKeys {
    static let apiKey = "65d00499677e59496ca2f318eb68c049"
}

enum ImageURL {
    case image(name: String?)
    
    func getURL() -> String {
        switch self {
        case .image(let name):
            return "\(APIConstants.IMAGE_BASE_URL)\(name ?? "")@2x.png"
        }
    }
}

enum API {
    case forcast(cityname: String, apiKey: String)
    case none
    func getURL() -> String {
        switch self {
        case .forcast(let cityname, let apiKey):
            return APIConstants.VERSION + "forecast?q=\(cityname)&apiKey=\(apiKey)&units=metric"
        case .none:
            return ""
        }
    }
}
