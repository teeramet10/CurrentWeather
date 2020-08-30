//
//  BaseResponse.swift
//  CurrentWeather
//
//  Created by Teeramet on 30/8/2563 BE.
//  Copyright © 2563 Teeramet. All rights reserved.
//

import Foundation
import ObjectMapper
class BaseResponse : ObjectMapperModel{
    var cod: Int?
    var message : String?
    
    
    override func mapping(map:Map) {
        self.cod <- map["cod"]
        self.message <- map["message"]
        
    }
}
