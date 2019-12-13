//
//  WeatherData.swift
//  WhenItsColdOutside
//
//  Created by Maciej Bałtowski on 13/12/2019.
//  Copyright © 2019 Maciej. All rights reserved.
//

import Foundation

struct WeatherData: Codable {
    let name: String
    let main: Main
    let weather: [Weather]
}

struct Main: Codable {
    let temp: Double
}

struct Weather: Codable {
    let description: String
    let id: Int
}
