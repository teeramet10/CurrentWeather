//
//  MockCurrentWeatherInteractor.swift
//  CurrentWeatherTests
//
//  Created by Teeramet on 30/8/2563 BE.
//  Copyright © 2563 Teeramet. All rights reserved.
//

import Foundation
@testable import CurrentWeather
import XCTest

class MockCurrentWeatherInteractor : CurrentWeatherInteractorProtocol{
    
    var getCurrentWeatherCalled = false
    var convertToFahrenheitCalled = false
    var convetToCelsiusCalled = false
    
    func getCurrentWeather(request: CurrentWeather.FetchWeather.Request) {
        
        getCurrentWeatherCalled = true
    }
    
    func convertToFahrenheit() {
        convertToFahrenheitCalled = true
    }
    
    func convertToCelsius() {
        convetToCelsiusCalled = true
    }
    
    
}
