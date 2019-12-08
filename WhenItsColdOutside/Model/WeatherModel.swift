//
//  WeatherModel.swift
//  WhenItsColdOutside
//
//  Created by Maciej Bałtowski on 08/12/2019.
//  Copyright © 2019 Maciej. All rights reserved.
//

import Foundation

struct WeatherModel {
    
    var temperature: String
    var cityName: String
    var conditionNum: Int
    
    var conditionName: String {
        switch conditionNum {
        case 200...232:
            return "cloud.bolt"
        case 300...321:
            return "cloud.drizzle"
        case 500...531:
            return "cloud.rain"
        case 600...622:
            return "cloud.snow"
        case 701...781:
            return "cloud.fog"
        case 800:
            return "sun.max"
        case 801...804:
            return "cloud.bolt"
        default:
            return "cloud"
        }
    }
}
