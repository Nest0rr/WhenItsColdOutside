//
//  WeatherManager.swift
//  WhenItsColdOutside
//
//  Created by Maciej Bałtowski on 08/12/2019.
//  Copyright © 2019 Maciej. All rights reserved.
//

import Foundation
import CoreLocation

protocol WeatherManagerDelegate {
    func didFailWithError(error: Error)
    func updateWeather(_ weatherManager: WeatherManager, _ weatherModel: WeatherModel)
}

struct WeatherManager {
    
    let delegate: WeatherManagerDelegate?
    
    let weatherUrl = "https://api.openweathermap.org/data/2.5/forecast?id=524901&APPID={APIKEY}&units=metric"
    
    //Notes: Updating weather URL with lat and lon taken from location system
    func fetchWeatherData(latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
        let updatedUrl = "\(weatherUrl)&lat=\(latitude)&lon=\(longitude)"
        performRequest(with: updatedUrl)
    }
    
    func performRequest(with updatedUrl: String) {
//MARK: - TODO: Create a URL session here (almost complete)
        if let url = URL(string: updatedUrl) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                if let safedata = data {
                    if let weather = self.parseJSON(from: safedata) {
                        self.delegate?.updateWeather(self, weather)
                    }
                }
            }
            task.resume()
        }
    }
    
//MARK: - TODO: parse JSON func here
    
    func parseJSON(from: Data) -> WeatherModel? {
        return nil
    }
}
