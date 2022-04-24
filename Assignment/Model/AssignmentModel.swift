//
//  AssignmentModel.swift
//  Assignment
//
//  Created by Mac Pro on 24/04/22.
//  Copyright © 2022 Gourav. All rights reserved.
//

import SwiftUI

// MARK: - RSSFeedModel
// MARK: - AssignmentModel
struct AssignmentModel: Codable {
    var messageAsString: String {
        if let message = message {
            switch message {
            case .string(let string): return string
            case .int(let int): return String(int)
            }
        }
        return ""
    }
    
    let cod: String?
    let message: QuantumValue?
    let list: [List]?
    let city: City?
}

// MARK: - City
struct City: Codable {
    let id: Int?
    let name: String?
    let coord: Coord?
    let country: String?
    let population, timezone, sunrise, sunset: Int?
}

// MARK: - Coord
struct Coord: Codable {
    let lat, lon: Double?
}

// MARK: - List
struct List: Codable {
    let dt: Double?
    let main: WeatherMain?
    let weather: [Weather]?
    let clouds: Clouds?
    let wind: Wind?
    let visibility, pop: Int?
    let dtTxt: String?

    enum CodingKeys: String, CodingKey {
        case dt, main, weather, clouds, wind, visibility, pop
        case dtTxt = "dt_txt"
    }
}

// MARK: - Clouds
struct Clouds: Codable {
    let all: Int?
}

// MARK: - MainClass
struct WeatherMain: Codable {
    let temp, feelsLike, tempMin, tempMax: Double?
    let pressure, seaLevel, grndLevel, humidity: Int?
    let tempKf: Double?
    
    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure
        case seaLevel = "sea_level"
        case grndLevel = "grnd_level"
        case humidity
        case tempKf = "temp_kf"
    }
}

// MARK: - Weather
struct Weather: Codable {
    let id: Int?
    let main: String?
    let weatherDescription: String?
    let icon: String?

    enum CodingKeys: String, CodingKey {
        case id, main
        case weatherDescription = "description"
        case icon
    }
}

// MARK: - Wind
struct Wind: Codable {
    let speed: Double?
    let deg: Int?
    let gust: Double?
}

enum QuantumValue: Codable {
    
    case int(Int), string(String)
    
    init(from decoder: Decoder) throws {
        if let int = try? decoder.singleValueContainer().decode(Int.self) {
            self = .int(int)
            return
        }
        if let string = try? decoder.singleValueContainer().decode(String.self) {
            self = .string(string)
            return
        }
        throw QuantumError.missingValue
    }
    
    enum QuantumError: Error {
        case missingValue
    }
}
