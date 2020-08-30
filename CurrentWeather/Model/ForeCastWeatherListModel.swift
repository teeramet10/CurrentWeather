//
//  ForeCastWeatherListModel.swift
//  CurrentWeather
//
//  Created by Teeramet on 30/8/2563 BE.
//  Copyright © 2563 Teeramet. All rights reserved.
//

import Foundation
import ObjectMapper
class ForeCastWeatherListModel:BaseResponse{
    var code : String?
    var dt : Int?
    var list : [ForeCastWeatherModel]? = []
    var unit :String?
    override func mapping(map: Map) {
        super.mapping(map: map)
        code <- map["cod"]
        message <- map["message"]
        dt <- map["dt"]
        list <- map["list"]
        unit <- map["unit"]
    }
    
}
