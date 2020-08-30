//
//  ForeCastWeatherModel.swift
//  CurrentWeather
//
//  Created by Teeramet on 30/8/2563 BE.
//  Copyright © 2563 Teeramet. All rights reserved.
//

import Foundation
import ObjectMapper
class ForeCastWeatherModel : ObjectMapperModel{
    
    
    var weather : [WeatherModel]? = []
    var main : TemperatureModel?
    var dateText : String? = ""
    
    override func mapping(map: Map) {
        super.mapping(map: map)
        weather <- map["weather"]
        main <- map["main"]
        dateText <- map["dt_txt"]
        
    }
}
