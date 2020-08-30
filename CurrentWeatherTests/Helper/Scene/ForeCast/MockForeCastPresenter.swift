//
//  MockForeCastPresenter.swift
//  CurrentWeatherTests
//
//  Created by Teeramet on 31/8/2563 BE.
//  Copyright © 2563 Teeramet. All rights reserved.
//


@testable import CurrentWeather
import XCTest
class MockForeCastPresenter  : ForeCastPresenterProtocol{
    var expectation : XCTestExpectation?
    var showForeCastListCalled  = false
    var showErrorCalled = false
    func showForeCastList(response: ForeCast.FetchForeCast.Response) {
        showForeCastListCalled = true
        expectation?.fulfill()
    }
    
    func showError(_ error: Error) {
        showErrorCalled = true
        expectation?.fulfill()
    }
    
    
}
