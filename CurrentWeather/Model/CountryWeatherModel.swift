//
//  WeatherModel.swift
//  CurrentWeather
//
//  Created by Teeramet on 29/8/2563 BE.
//  Copyright © 2563 Teeramet. All rights reserved.
//

import Foundation
import ObjectMapper
class CountryWeatherModel : BaseResponse{
    var weather : [WeatherModel] = []
    var main : TemperatureModel?
    var name : String?
    var unit :String?
    
    override func mapping(map:Map) {
        super.mapping(map: map)
        self.weather <- map["weather"]
        self.main <- map["main"]
        self.name <- map["name"]
        self.unit <- map["unit"]
    }
    

    
    
}
