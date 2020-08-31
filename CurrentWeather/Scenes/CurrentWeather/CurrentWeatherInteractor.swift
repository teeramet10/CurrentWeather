//
//  CurrentWeatherInteractor.swift
//  CurrentWeather
//
//  Created by Teeramet on 29/8/2563 BE.
//  Copyright © 2563 Teeramet. All rights reserved.
//

import Foundation
import Moya
import RxSwift


class CurrentWeatherInteractor  : CurrentWeatherInteractorProtocol{
    
    var presenter : CurrentWeatherPresenterProtocol?
        
    var workers : CurrentWeatherWorkerProtocol?
    
    var disposeBag = DisposeBag()
    
    var tempurature : Float = 0
    
    func getCurrentWeather(request: CurrentWeather.FetchWeather.Request) {
        workers?.getCurrentWeather(request.cityName, request.units, completionHandler: {[weak self](data , error) in
            
            guard let strongSelf = self else{return}
            
            guard error == nil else{
                strongSelf.presenter?.showError(error ?? ResponseError.init("Can't get weather"))
                return
            }
            
            strongSelf.tempurature = data?.main?.temp ?? 0
            let response = CurrentWeather.FetchWeather.Response(weather: data)
            strongSelf.presenter?.showWeather(response)
        })
        
        
    }
    
    //[°C] × 9 / 5 + 32
    func convertToCelsius() {
      
        let result = (tempurature-32) * 5/9
        self.tempurature = result
        let response = CurrentWeather.ConvertWeather.Response(temperature: result, unit: .Metric)
        self.presenter?.showConvertWeather(response: response)
    }
    
    //([F] - 32) × 5/9
    func convertToFahrenheit() {
        let result = (tempurature/5) * 9 + 32
        self.tempurature = result
        let response = CurrentWeather.ConvertWeather.Response(temperature: result, unit: .Imperial)
        self.presenter?.showConvertWeather(response: response)
    }
    
}
