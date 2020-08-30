//
//  APIWeatherDatasource.swift
//  CurrentWeather
//
//  Created by Teeramet on 29/8/2563 BE.
//  Copyright © 2563 Teeramet. All rights reserved.
//

import Foundation
import RxSwift
import Moya
class APIWeatherDataSource : WeatherDataSourceProtocol{
    
    
    let provider = MoyaProvider<WeatherService>()
    
    func getWeather(_ cityName: String , _ unit : String) -> Observable<CountryWeatherModel> {
        return provider.requestAPI(.currentWeather(cityName,unit))
    }
    
    func getForeCastWeather(_ cityName: String, unit: String) -> Observable<ForeCastWeatherListModel> {
        return provider.requestAPI(.foreCast(cityName,unit))
    }
    
    
}
