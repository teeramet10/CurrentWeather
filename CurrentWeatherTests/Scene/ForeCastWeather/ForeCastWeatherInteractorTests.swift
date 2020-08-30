//
//  ForeCastWeatherInteractorTests.swift
//  CurrentWeatherTests
//
//  Created by Teeramet on 31/8/2563 BE.
//  Copyright © 2563 Teeramet. All rights reserved.
//

import XCTest
@testable import CurrentWeather
class ForeCastWeatherInteractorTests : XCTestCase{
    func test_getForeCastSuccess() {
        
        let expectation = XCTestExpectation(description: "Get ForeCast API")
        let presenter = MockForeCastPresenter()
        presenter.expectation = expectation
        
        let interactor = ForeCastInteractor()
        interactor.presenter = presenter
        interactor.weatherRepository =  WeatherRepository(MockWeatherDataSource(success: true))
      
        let request = ForeCast.FetchForeCast.Request(cityName: "Bangkok", unit: Units.Metric.rawValue)
        interactor.fetchForeCast(request: request)
        
        wait(for: [expectation], timeout: 5)
        
        XCTAssertTrue(presenter.showForeCastListCalled)
        XCTAssertFalse(presenter.showErrorCalled)
    }
    
    
    func test_getForeCastFailed() {
        let expectation = XCTestExpectation(description: "Get ForeCast API")
        let presenter = MockForeCastPresenter()
        presenter.expectation = expectation
        
        let interactor = ForeCastInteractor()
        interactor.presenter = presenter
        interactor.weatherRepository =  WeatherRepository(MockWeatherDataSource(success: false))
        
        let request = ForeCast.FetchForeCast.Request(cityName: "", unit: Units.Metric.rawValue)
        interactor.fetchForeCast(request: request)
        
        wait(for: [expectation], timeout: 5)
        
        XCTAssertTrue(presenter.showErrorCalled)
        XCTAssertFalse(presenter.showForeCastListCalled)
        
    }
}
