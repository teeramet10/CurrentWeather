//
//  MockForeCastInteractor.swift
//  CurrentWeatherTests
//
//  Created by Teeramet on 31/8/2563 BE.
//  Copyright © 2563 Teeramet. All rights reserved.
//

@testable import CurrentWeather
import XCTest
class MockForeCastInteractor  : ForeCastInteractorProtocol{
    
    var fetchForeCastCalled = false
    
    func fetchForeCast(request: ForeCast.FetchForeCast.Request) {
        fetchForeCastCalled = true
    }
    
    
}
