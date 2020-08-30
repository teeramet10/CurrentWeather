//
//  WeatherDatasourceProtocol.swift
//  CurrentWeather
//
//  Created by Teeramet on 29/8/2563 BE.
//  Copyright © 2563 Teeramet. All rights reserved.
//

import Foundation
import RxSwift
protocol  WeatherDataSourceProtocol{
    func getWeather(_ cityName : String, _ unit : String) -> Observable<CountryWeatherModel>
    
    func getForeCastWeather(_ cityName: String, unit: String) -> Observable<ForeCastWeatherListModel> 
}
