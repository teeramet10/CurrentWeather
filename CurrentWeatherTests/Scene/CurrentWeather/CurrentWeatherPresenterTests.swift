//
//  CurrentWeatherPresenterTests.swift
//  CurrentWeatherTests
//
//  Created by Teeramet on 30/8/2563 BE.
//  Copyright © 2563 Teeramet. All rights reserved.
//

import Foundation
import XCTest
@testable import CurrentWeather


class CurrentWeatherPresenterTests : XCTestCase{
    
    
    override func setUp() {
       
    }
    
    
    func test_getWeatherSuccess() {
        
        let presenter = CurrentWeatherPresenter()
        let viewController = MockCurrentWeatherViewController()
        presenter.viewController = viewController
        let response = CurrentWeather.FetchWeather.Response(weather: CountryWeatherModel())
        response.weather?.cod = 200
        presenter.showWeather(response)
        XCTAssertTrue(viewController.displayWeatherCalled)
        XCTAssertFalse(viewController.showAlertCalled)
        XCTAssertFalse(viewController.displayConvertWeatherCalled)
        
    }
    
    func test_getWeatherWeatherNil() {
        
        let presenter = CurrentWeatherPresenter()
        let viewController = MockCurrentWeatherViewController()
        presenter.viewController = viewController
        let response = CurrentWeather.FetchWeather.Response()
        presenter.showWeather(response)
        
        XCTAssertTrue(viewController.showAlertCalled)
        XCTAssertFalse(viewController.displayWeatherCalled)
        XCTAssertFalse(viewController.displayConvertWeatherCalled)
        
    }
    
    
    func test_showDetailCelsius(){
        let presenter = CurrentWeatherPresenter()
        let viewController = MockCurrentWeatherViewController()
        presenter.viewController = viewController
        
        let weather = CountryWeatherModel(JSONString: MockGetWeatherCityJSONResponse.jsonSuccess) ?? CountryWeatherModel()
        weather.unit = Units.Metric.rawValue
        let response = CurrentWeather.FetchWeather.Response(weather: weather)
        presenter.showWeather(response)
        
       
        XCTAssertEqual(viewController.displayAlertMessage, "")
        XCTAssertEqual(viewController.displayHumidity,"\(weather.main?.humidity ?? 0)")
        XCTAssertEqual(viewController.displayIcon,"http://openweathermap.org/img/wn/\(weather.weather.first?.icon ?? "")@2x.png")
        XCTAssertEqual(viewController.displayCity,weather.name ?? "")
        XCTAssertEqual(viewController.displayWeather,"\(weather.main?.temp ?? 0) °C")
    }
    
    func test_showDetailFahrenheit(){
        let presenter = CurrentWeatherPresenter()
        let viewController = MockCurrentWeatherViewController()
        presenter.viewController = viewController
        
        let weather = CountryWeatherModel(JSONString: MockGetWeatherCityJSONResponse.jsonSuccess) ?? CountryWeatherModel()
        weather.unit = Units.Imperial.rawValue
        let response = CurrentWeather.FetchWeather.Response(weather: weather)
        presenter.showWeather(response)
        
        XCTAssertEqual(viewController.displayAlertMessage, "")
        XCTAssertEqual(viewController.displayHumidity,"\(weather.main?.humidity ?? 0)")
        XCTAssertEqual(viewController.displayIcon,"http://openweathermap.org/img/wn/\(weather.weather.first?.icon ?? "")@2x.png")
        XCTAssertEqual(viewController.displayCity,weather.name ?? "")
        XCTAssertEqual(viewController.displayWeather,"\(weather.main?.temp ?? 0) °F")
    }
    
    func test_showAlertFailedGetDetail(){
          let presenter = CurrentWeatherPresenter()
          let viewController = MockCurrentWeatherViewController()
          presenter.viewController = viewController
      
          let weather = CountryWeatherModel(JSONString: MockGetWeatherCityJSONResponse.jsonFailed) ?? CountryWeatherModel()
          weather.unit = Units.Imperial.rawValue
          let response = CurrentWeather.FetchWeather.Response(weather: weather)
          presenter.showWeather(response)
          XCTAssertEqual(viewController.displayAlertMessage, "city not found")
          XCTAssertEqual(viewController.displayHumidity,"")
          XCTAssertEqual(viewController.displayIcon,"")
          XCTAssertEqual(viewController.displayCity,"")
          XCTAssertEqual(viewController.displayWeather,"")
      }
    
    func test_convertWeatherToFahrenheit(){
        let presenter = CurrentWeatherPresenter()
        let viewController = MockCurrentWeatherViewController()
        presenter.viewController = viewController
        let response = CurrentWeather.ConvertWeather.Response(temperature: 122, unit: .Imperial)
        presenter.showConvertWeather(response: response)
        XCTAssertEqual(viewController.displayAlertMessage, "")
        XCTAssertEqual(viewController.displayHumidity,"")
        XCTAssertEqual(viewController.displayIcon,"")
        XCTAssertEqual(viewController.displayCity,"")
        XCTAssertEqual(viewController.displayWeather,"\(String(format:"%.2f",response.temperature)) °F")
    }
    
    func test_showConvertWeatherToCelsius(){
        let presenter = CurrentWeatherPresenter()
        let viewController = MockCurrentWeatherViewController()
        presenter.viewController = viewController
        let response = CurrentWeather.ConvertWeather.Response(temperature: 50, unit: .Metric)
        presenter.showConvertWeather(response: response)
        XCTAssertEqual(viewController.displayAlertMessage, "")
        XCTAssertEqual(viewController.displayHumidity,"")
        XCTAssertEqual(viewController.displayIcon,"")
        XCTAssertEqual(viewController.displayCity,"")
        XCTAssertEqual(viewController.displayWeather,"\(String(format:"%.2f",response.temperature)) °C")
    }
    
   
    
    
  
}
