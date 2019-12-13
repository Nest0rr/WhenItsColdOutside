//
//  WeatherModel.swift
//  WhenItsColdOutside
//
//  Created by Maciej Bałtowski on 08/12/2019.
//  Copyright © 2019 Maciej. All rights reserved.
//

import Foundation

struct WeatherModel {
    
    var temperature: Double
    var cityName: String
    var conditionNum: Int
    
    var conditionName: String {
        switch conditionNum {
        case 200...232:
            return "tstorm2"
        case 300...321:
            return "light_rain"
        case 500...531:
            return "shower3"
        case 600...622:
            return "snow4"
        case 701...781:
            return "overcast"
        case 800:
            return "sunny"
        case 801...804:
            return "tstorm3"
        default:
            return "cloudy2"
        }
    }
}
