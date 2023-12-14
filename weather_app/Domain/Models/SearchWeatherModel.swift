//
//  SearchWeatherModel.swift
//  weather_app
//
//  Created by Guvanch Amanov on 10.12.23.
//

import Foundation


// MARK: - SearchWeatherModelElement
struct SearchWeatherModelElement: Codable {
    let name: String
    let localNames: [String: String]?
    let lat, lon: Double
    let country: String
    let state: String?

    enum CodingKeys: String, CodingKey {
        case name
        case localNames = "local_names"
        case lat, lon, country, state
    }
}

