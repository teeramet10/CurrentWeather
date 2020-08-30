//
//  WeatherModel.swift
//  CurrentWeather
//
//  Created by Teeramet on 30/8/2563 BE.
//  Copyright © 2563 Teeramet. All rights reserved.
//

import Foundation
import ObjectMapper
class WeatherModel : ObjectMapperModel{
    var id : Int?
    var main : String?
    var description: String?
    var icon: String?
    
    
    override func mapping(map:Map) {
        super.mapping(map: map)
        self.id <- map["id"]
        self.main <- map["main"]
        self.description <- map["description"]
        self.icon <- map["icon"]
    }
    
}
