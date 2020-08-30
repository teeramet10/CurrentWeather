//
//  ForeCastWeatherPresenterTests.swift
//  CurrentWeatherTests
//
//  Created by Teeramet on 31/8/2563 BE.
//  Copyright © 2563 Teeramet. All rights reserved.
//


import XCTest
@testable import CurrentWeather
class ForeCastWeatherPresenterTests : XCTestCase{

    
    func test_getForeCastSuccess() {
        
        let presenter = ForeCastPresenter()
        let viewController = MockForeCastViewController()
        presenter.viewController = viewController
        
        let response = ForeCast.FetchForeCast.Response(foreCastModel: ForeCastWeatherListModel.init(JSONString: MockGetForeCastWeatherJSONResponse.jsonSuccess) ?? ForeCastWeatherListModel())
        presenter.showForeCastList(response: response)
        XCTAssertTrue(viewController.showForecastListCalled)
        XCTAssertFalse(viewController.showAlertCalled)
        XCTAssertNotNil(viewController.viewModel)
        XCTAssertEqual(viewController.displayAlert, "")
    }
    
    func test_getForeCastFalied() {
           
           let presenter = ForeCastPresenter()
           let viewController = MockForeCastViewController()
           presenter.viewController = viewController
           
        let response = ForeCast.FetchForeCast.Response(foreCastModel: ForeCastWeatherListModel.init(JSONString: MockGetForeCastWeatherJSONResponse.jsonFailed) ?? ForeCastWeatherListModel())
        presenter.showForeCastList(response: response)
        
        XCTAssertNil(viewController.viewModel)
        XCTAssertEqual(viewController.displayAlert, response.foreCastModel?.message)
        XCTAssertTrue(viewController.showAlertCalled)
        XCTAssertFalse(viewController.showForecastListCalled)
        
    }
}
