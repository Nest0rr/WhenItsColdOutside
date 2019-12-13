//
//  ViewController.swift
//  WhenItsColdOutside
//
//  Created by Maciej Bałtowski on 08/12/2019.
//  Copyright © 2019 Maciej. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {
    
    @IBOutlet weak var conditionImage: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    
    let locationManager = CLLocationManager()
    var weatherManager = WeatherManager(delegate: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
        
        weatherManager.delegate = self
        
    }

}

extension ViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            locationManager.stopUpdatingLocation()
            let lat = location.coordinate.latitude
            let lon = location.coordinate.longitude
            weatherManager.fetchWeatherData(latitude: lat, longitude: lon)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}

extension ViewController: WeatherManagerDelegate {
    func didFailWithError(error: Error) {
        print(error)
    }
    
    func updateWeather(_ weatherManager: WeatherManager, _ weatherModel: WeatherModel) {
        DispatchQueue.main.async {
            self.temperatureLabel.text = String(Int(weatherModel.temperature))
            self.conditionImage.image = UIImage(named: weatherModel.conditionName)
            self.cityLabel.text = weatherModel.cityName
        }
        
    }
    
    
}
