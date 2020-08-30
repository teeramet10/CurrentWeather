//
//  MockCurrentWeatherViewController.swift
//  CurrentWeatherTests
//
//  Created by Teeramet on 30/8/2563 BE.
//  Copyright © 2563 Teeramet. All rights reserved.
//

@testable import CurrentWeather
import XCTest
class MockCurrentWeatherViewController : CurrentWeatherControllerProtocol{
    
    var displayWeatherCalled = false
    var showAlertCalled = false
    var displayConvertWeatherCalled = false
    var displayAlertMessage = ""
    var displayWeather = ""
    var displayCity = ""
    var displayHumidity = ""
    var displayIcon = ""
    
    func displayWeather(_ viewModel: CurrentWeather.FetchWeather.ViewModel) {
        displayCity = viewModel.weather.city
        displayHumidity = viewModel.weather.humidity
        displayIcon = viewModel.weather.icon
        displayWeather = viewModel.weather.temp
        
        displayWeatherCalled = true
    }
    
    func showAlert(_ message: String) {
        displayAlertMessage = message
        showAlertCalled = true
    }
    
    func displayConvertWeather(_ viewModel: CurrentWeather.ConvertWeather.ViewModel) {
        displayWeather = viewModel.temperatureText
        displayConvertWeatherCalled = true
    }
    
    
    
    
    

}
