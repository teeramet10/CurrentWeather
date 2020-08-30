//
//  WeatherRepositoryTests.swift
//  CurrentWeatherTests
//
//  Created by Teeramet on 29/8/2563 BE.
//  Copyright © 2563 Teeramet. All rights reserved.
//

import XCTest
@testable import CurrentWeather
class CurrentWeatherInteractorTests : XCTestCase{
    
    
    override func setUp() {
       
    }
    
    
    func test_getWeatherSuccess() {
        
        let expectation = XCTestExpectation(description: "Get Weather API")
        let presenter = MockCurrentWeatherPresenter()
        presenter.expectation = expectation
        
        let interactor = CurrentWeatherInteractor()
        interactor.presenter = presenter
        interactor.weatherRepository =  WeatherRepository(MockWeatherDataSource(success: true))
      
        let request = CurrentWeather.FetchWeather.Request(cityName: "Bangkok", units: Units.Metric.rawValue)
        interactor.getCurrentWeather(request: request)
        
        wait(for: [expectation], timeout: 5)
        
        XCTAssertTrue(presenter.showWeatherCalled)
        XCTAssertFalse(presenter.showErrorCalled)
        XCTAssertFalse(presenter.showConvertWeatherCalled)
    }
    
    
    func test_getWeatherFailed() {
        let expectation = XCTestExpectation(description: "Get Weather API")
        let presenter = MockCurrentWeatherPresenter()
        presenter.expectation = expectation
        
        let interactor = CurrentWeatherInteractor()
        interactor.presenter = presenter
        interactor.weatherRepository =  WeatherRepository(MockWeatherDataSource.init(success: false))
        let request = CurrentWeather.FetchWeather.Request(cityName: "", units: Units.Metric.rawValue)
        interactor.getCurrentWeather(request: request)
        
        wait(for: [expectation], timeout: 5)
       
        XCTAssertTrue(presenter.showErrorCalled)
        
        XCTAssertFalse(presenter.showWeatherCalled)
        
        XCTAssertFalse(presenter.showConvertWeatherCalled)
        
    }
    
    func test_ConvertToFahrenheitSuccess(){
        let presenter = MockCurrentWeatherPresenter()
        
        let interactor = CurrentWeatherInteractor()
        interactor.tempurature = 30.6
        interactor.presenter = presenter
        interactor.weatherRepository =  WeatherRepository(MockWeatherDataSource.init(success: false))
        interactor.convertToFahrenheit()
                
        XCTAssertTrue(presenter.showConvertWeatherCalled)
        
        XCTAssertFalse(presenter.showErrorCalled)
        
        XCTAssertFalse(presenter.showWeatherCalled)

    }
    
    func test_ConvertToCelsiusSuccess(){
        let presenter = MockCurrentWeatherPresenter()
        
        let interactor = CurrentWeatherInteractor()
        interactor.tempurature = 122
        interactor.presenter = presenter
        interactor.weatherRepository =  WeatherRepository(MockWeatherDataSource.init(success: false))
        interactor.convertToCelsius()
                
        XCTAssertTrue(presenter.showConvertWeatherCalled)
        
        XCTAssertFalse(presenter.showErrorCalled)
        
        XCTAssertFalse(presenter.showWeatherCalled)

    }
    
    
}
