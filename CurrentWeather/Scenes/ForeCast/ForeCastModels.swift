//
//  ForeCastModels.swift
//  CurrentWeather
//
//  Created by Teeramet on 30/8/2563 BE.
//  Copyright © 2563 Teeramet. All rights reserved.
//

import Foundation

enum ForeCast{
    
    enum FetchForeCast{
        struct Request {
            var cityName :String
            var unit :String
        }
        
        struct Response {
            var foreCastModel : ForeCastWeatherListModel?
        }
        
        struct ViewModel {
            var displayList : [ForeCastGroupViewModel]
        }
    }
}
