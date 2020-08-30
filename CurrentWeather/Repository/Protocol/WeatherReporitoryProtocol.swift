//
//  WeatherReporitory.swift
//  CurrentWeather
//
//  Created by Teeramet on 29/8/2563 BE.
//  Copyright © 2563 Teeramet. All rights reserved.
//

import Foundation
import RxSwift
protocol WeatherRepositoryProtocol  : class{
    
    func getWeather(_ cityName: String , _ unit : String)  -> Observable<CountryWeatherModel>
    
    func getForeCastWeathre(_ cityName :String ,_  unit: String) -> Observable<ForeCastWeatherListModel>
         
}
