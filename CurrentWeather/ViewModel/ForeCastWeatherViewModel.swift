//
//  ForeCastWeatherViewModel.swift
//  CurrentWeather
//
//  Created by Teeramet on 30/8/2563 BE.
//  Copyright © 2563 Teeramet. All rights reserved.
//

import Foundation
class ForeCastWeatherViewModel {
    var temperature : String = ""
    var description : String = ""
    var icon :String = ""
    var title :String = ""
    
    init(title :String, temperature : String , description: String , icon :String ) {
        self.temperature = temperature
        self.title = title
        self.description = description
        self.icon = icon
    }
}
