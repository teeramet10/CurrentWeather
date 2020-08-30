//
//  CurrentWeatherPresenter.swift
//  CurrentWeather
//
//  Created by Teeramet on 29/8/2563 BE.
//  Copyright © 2563 Teeramet. All rights reserved.
//

import Foundation


class CurrentWeatherPresenter : CurrentWeatherPresenterProtocol{
    
    weak var viewController :  CurrentWeatherControllerProtocol? 
    
    
    func showError(_ error: Error) {
        let message = ResponseError.getError(error: error)
        viewController?.showAlert(message)
    }
    
    func showWeather(_ response: CurrentWeather.FetchWeather.Response) {
        guard let data = response.weather else{
            viewController?.showAlert(response.weather?.message ?? "")
            return
        }
        
        guard data.cod == 200 else{
            viewController?.showAlert(response.weather?.message ?? "")
            return
        }
        
        let city = data.name ?? ""
        let icon = "http://openweathermap.org/img/wn/\(data.weather.first?.icon ?? "")@2x.png"
        let unit = data.unit == Units.Metric.rawValue ? "°C": "°F"
        
        let temp = "\(data.main?.temp ?? 0) \(unit)"
        let humidity = String(data.main?.humidity ?? 0)
        
        let model = CountryWeatherViewModel(city: city, icon: icon, temp: temp, humidity: humidity)
        
        let viewModel = CurrentWeather.FetchWeather.ViewModel(weather: model)
        viewController?.displayWeather(viewModel)
    }
    
    func showConvertWeather(response : CurrentWeather.ConvertWeather.Response) {
        let unit = response.unit
        let temperature = response.temperature
        
        let unitText = unit.rawValue == Units.Metric.rawValue ? "°C": "°F"
        let temp = "\(String(format:"%.2f",temperature)) \(unitText)"
        let viewModel = CurrentWeather.ConvertWeather.ViewModel(temperatureText:temp )
        viewController?.displayConvertWeather(viewModel)
    }
}
