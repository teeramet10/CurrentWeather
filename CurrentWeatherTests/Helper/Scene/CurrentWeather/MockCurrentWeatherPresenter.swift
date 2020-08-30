//
//  MockCurrentWeatherPresenter.swift
//  CurrentWeatherTests
//
//  Created by Teeramet on 30/8/2563 BE.
//  Copyright © 2563 Teeramet. All rights reserved.
//

@testable import CurrentWeather
import XCTest
class MockCurrentWeatherPresenter : CurrentWeatherPresenterProtocol{
    var expectation : XCTestExpectation?
    var showErrorCalled = false
    var showWeatherCalled = false
    var showConvertWeatherCalled = false
    
    var tempratureConvert : Float = 0
    
    func showError(_ error: Error) {
        showErrorCalled = true
        expectation?.fulfill()
    }
    
    func showWeather(_ response: CurrentWeather.FetchWeather.Response) {
        showWeatherCalled = true
        expectation?.fulfill()
    }
    
    func showConvertWeather(response: CurrentWeather.ConvertWeather.Response) {
        tempratureConvert = response.temperature
        showConvertWeatherCalled = true
        expectation?.fulfill()
    }
    
}
