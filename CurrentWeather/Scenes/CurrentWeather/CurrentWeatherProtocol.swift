//
//  CurrentWeatherProtocol.swift
//  CurrentWeather
//
//  Created by Teeramet on 29/8/2563 BE.
//  Copyright © 2563 Teeramet. All rights reserved.
//

import Foundation
protocol CurrentWeatherControllerProtocol : class{
    func displayWeather(_ viewModel : CurrentWeather.FetchWeather.ViewModel)
    func showAlert(_ message : String)
    func displayConvertWeather(_ viewModel : CurrentWeather.ConvertWeather.ViewModel)
}


protocol CurrentWeatherPresenterProtocol : class{
    func showError(_ error :Error)
    func showWeather(_ response : CurrentWeather.FetchWeather.Response)
    func showConvertWeather(response : CurrentWeather.ConvertWeather.Response)
}

protocol CurrentWeatherInteractorProtocol : class{
    func getCurrentWeather(request : CurrentWeather.FetchWeather.Request)
    func convertToFahrenheit()
    func convertToCelsius()
}

protocol CurrentWeatherRoutingProtocol : class{
    func routeToForeCast(_ cityName : String,  _ unit:String)
    
}
