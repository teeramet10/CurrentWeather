//
//  CurrentWeatherModels.swift
//  CurrentWeather
//
//  Created by Teeramet on 30/8/2563 BE.
//  Copyright © 2563 Teeramet. All rights reserved.
//

import Foundation

enum CurrentWeather{
    
    enum FetchWeather{
        struct Request {
            var cityName :String
            var units : String
        }
        
        struct Response {
            var weather : CountryWeatherModel?
        }
        
        struct ViewModel {
             var weather : CountryWeatherViewModel
        }
    }
    
    enum ConvertWeather{
        struct Request {
            
        }
        
        struct Response {
            var temperature : Float
            var unit : Units
        }
        
        struct ViewModel {
            var temperatureText : String
        }
    }
}
