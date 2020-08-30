//
//  TemperatureModel.swift
//  CurrentWeather
//
//  Created by Teeramet on 30/8/2563 BE.
//  Copyright © 2563 Teeramet. All rights reserved.
//

import Foundation
import ObjectMapper
class TemperatureModel : ObjectMapperModel{
    var temp: Float?
    var feelsLike: Float?
    var tempMin: Float?
    var tempMax: Float?
    var pressure: Float?
    var humidity: Int?
    var seaLevel : Int?
    var grndLevel : Int?
    var tempKF : Float?
    
    override func mapping(map:Map) {
        super.mapping(map: map)
        self.temp <- map["temp"]
        self.feelsLike <- map["feels_like"]
        self.tempMin <- map["temp_min"]
        self.tempMax <- map["tempMax"]
        self.pressure <- map["pressure"]
        self.humidity <- map["humidity"]
        self.seaLevel <- map["sea_level"]
        self.grndLevel <- map["grnd_level"]
        self.tempKF <- map["temp_kf"]
    }
}
