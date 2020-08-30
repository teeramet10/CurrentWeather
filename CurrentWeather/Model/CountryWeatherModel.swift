//
//  WeatherModel.swift
//  CurrentWeather
//
//  Created by Teeramet on 29/8/2563 BE.
//  Copyright © 2563 Teeramet. All rights reserved.
//

import Foundation
class CountryWeatherModel : Codable{
    var weather : WeatherModel?
    var main : TemperatureModel?
    var cod: Int?
    var message : String?
}


class WeatherModel : Codable{
    var id : Int?
    var main : String?
    var description: String?
    var icon: String?
    
}

class TemperatureModel : Codable{
    var temp: Float?
    var feels_like: Float?
    var temp_min: Float?
    var temp_max: Float?
    var pressure: Float?
    var humidity: Int?
}
