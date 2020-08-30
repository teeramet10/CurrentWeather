//
//  CurrentWeatherPresenter.swift
//  CurrentWeather
//
//  Created by Teeramet on 29/8/2563 BE.
//  Copyright © 2563 Teeramet. All rights reserved.
//

import Foundation


class CurrentWeatherPresenter : CurrentWeatherPresenterProtocol{
    
    var viewController :  CurrentWeatherControllerProtocol? 
    
    
    func showError(_ error: Error) {
        
    }
    
    func showWeather(_ response: CountryWeatherModel) {
        let city = response.name ?? ""
        let icon = "http://openweathermap.org/img/wn/\(response.weather.first?.icon ?? "")@2x.png"
        let temp = String(response.main?.temp ?? 0)
        let humidity = String(response.main?.humidity ?? 0)
        let viewModel = CountryWeatherViewModel(city: city, icon: icon, temp: temp, humidity: humidity)
        viewController?.displayWeather(viewModel)
    }
    
    func showConvertWeather() {
        
    }
}
