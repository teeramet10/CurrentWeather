//
//  CurrentWeatherViewControllerTests.swift
//  CurrentWeatherTests
//
//  Created by Teeramet on 31/8/2563 BE.
//  Copyright © 2563 Teeramet. All rights reserved.
//

import Foundation
import XCTest
@testable import CurrentWeather

class CurrentWeatherViewControllerTests: XCTestCase{
    
    var viewController : CurrentWeatherController!
    
    var window : UIWindow!
    
    override func setUp() {
        super.setUp()
        window = UIWindow()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        viewController = storyboard.instantiateViewController(identifier: CurrentWeatherController.identifier) as  CurrentWeatherController
    }
    
    
    override func tearDown() {
        window = nil
        super.tearDown()
    }
    
    func loadView(){
        window.addSubview(viewController.view)
        RunLoop.current.run(until: Date())
    }

    func test_displayWeather(){
        loadView()
      
        let viewModel = CurrentWeather.FetchWeather.ViewModel(weather: CountryWeatherViewModel(city: "Bangkok", icon: "", temp: "50 °C", humidity: "70"))
        viewController.displayWeather(viewModel)
        
        let displayCity = viewController.cityTextfield.text
        let displatTemp = viewController.temperatureLabel.text
        let displayHumidity = viewController.humidityLabel.text
        
        XCTAssertEqual(displayCity, viewModel.weather.city)
        
        XCTAssertEqual(displatTemp, viewModel.weather.temp)
        
        XCTAssertEqual(displayHumidity, viewModel.weather.humidity)
        
    }
    
    
    
    func test_showConvert(){
        loadView()
        
        let viewModel = CurrentWeather.ConvertWeather.ViewModel(temperatureText: "50")
        viewController.displayConvertWeather(viewModel)
        
        let displayWeather = viewController.temperatureLabel.text
        XCTAssertEqual(displayWeather, "50")
    }
    
    func test_enterCity(){
        loadView()
        let interactor =  MockCurrentWeatherInteractor()
        viewController.interactor = interactor
        
        viewController.onEnterCity(UIButton())
        
        XCTAssertTrue(interactor.getCurrentWeatherCalled)
        XCTAssertFalse(interactor.convertToFahrenheitCalled)
        XCTAssertFalse(interactor.convetToCelsiusCalled)
    }
    
    func test_convertFahrenheitSuccess(){
        loadView()
        let interactor =  MockCurrentWeatherInteractor()
        viewController.interactor = interactor
        viewController.unit = .Metric
        viewController.onConvertTemp(UIButton())
        
        XCTAssertTrue(interactor.convertToFahrenheitCalled)
        XCTAssertFalse(interactor.convetToCelsiusCalled)
        XCTAssertFalse(interactor.getCurrentWeatherCalled)
    }
    
    func test_convertFahrenheitFailed(){
        loadView()
        let interactor =  MockCurrentWeatherInteractor()
        viewController.interactor = interactor
        viewController.unit = .Imperial
        viewController.onConvertTemp(UIButton())
        
        XCTAssertFalse(interactor.convertToFahrenheitCalled)
        XCTAssertTrue(interactor.convetToCelsiusCalled)
        XCTAssertFalse(interactor.getCurrentWeatherCalled)
        
    }
    
    func test_convertCelsiusSuccess(){
        loadView()
        let interactor =  MockCurrentWeatherInteractor()
        viewController.interactor = interactor
        viewController.unit = .Imperial
        viewController.onConvertTemp(UIButton())
        
        XCTAssertFalse(interactor.convertToFahrenheitCalled)
        XCTAssertTrue(interactor.convetToCelsiusCalled)
        XCTAssertFalse(interactor.getCurrentWeatherCalled)
    }
    
    func test_convertCelsiusFailed(){
        loadView()
        let interactor =  MockCurrentWeatherInteractor()
        viewController.interactor = interactor
        viewController.unit = .Metric
        viewController.onConvertTemp(UIButton())
        
        XCTAssertTrue(interactor.convertToFahrenheitCalled)
        XCTAssertFalse(interactor.convetToCelsiusCalled)
        XCTAssertFalse(interactor.getCurrentWeatherCalled)
        
    }
    
    
}
