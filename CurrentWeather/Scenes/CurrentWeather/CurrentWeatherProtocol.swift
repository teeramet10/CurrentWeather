//
//  CurrentWeatherProtocol.swift
//  CurrentWeather
//
//  Created by Teeramet on 29/8/2563 BE.
//  Copyright © 2563 Teeramet. All rights reserved.
//

import Foundation
protocol CurrentWeatherControllerProtocol {
    func displayWeather(_ viewModel : CountryWeatherViewModel)
    func convertWeatherSuccess(_ temperature : String)
}


protocol CurrentWeatherPresenterProtocol{
    func showError(_ error :Error)
    func showWeather(_ response : CountryWeatherModel)
    func showConvertWeather()
}

protocol CurrentWeatherInteractorProtocol{
    func getCurrentWeather(_ cityName :String , _ unit :String)
    func convertToFahrenheit()
    func convertToCelsius()
}

protocol CurrentWeatherRoutingProtocol {
    func routeToForeCast(_ cityName : String)
}
