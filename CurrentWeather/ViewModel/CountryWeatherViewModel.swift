//
//  CountryWeatherViewModel.swift
//  CurrentWeather
//
//  Created by Teeramet on 30/8/2563 BE.
//  Copyright © 2563 Teeramet. All rights reserved.
//

import Foundation
class CountryWeatherViewModel{
    var city : String
    var icon : String
    var temp : String
    var humidity : String
    
    
    init(city :String , icon :String , temp :String , humidity :String) {
        self.city  = city
        self.icon = icon
        self.temp = temp
        self.humidity = humidity
    }
}
 
