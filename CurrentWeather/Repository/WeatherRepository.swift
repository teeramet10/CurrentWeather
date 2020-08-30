//
//  WeatherRepository.swift
//  CurrentWeather
//
//  Created by Teeramet on 29/8/2563 BE.
//  Copyright © 2563 Teeramet. All rights reserved.
//

import Foundation
import RxSwift
class WeatherRepository : WeatherRepositoryProtocol{
   
    
    var datasource : WeatherDataSourceProtocol
    
    init(_ datasource : WeatherDataSourceProtocol) {
        self.datasource = datasource
    }
    
    func getWeather(_ cityName: String, _ unit :String) -> Observable<CountryWeatherModel> {
        return datasource.getWeather(cityName,unit).map{response in
            response.unit = unit
            return response
        }
    }
    
    func getForeCastWeathre(_ cityName: String, _ unit: String) -> Observable<ForeCastWeatherListModel> {
        return datasource.getForeCastWeather(cityName, unit: unit).map{response in
            response.unit = unit
            return response
            
        }
    }
    
    
    
}
