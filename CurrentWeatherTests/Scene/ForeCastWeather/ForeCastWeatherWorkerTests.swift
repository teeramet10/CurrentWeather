//
//  ForeCastWeatherWorkerTests.swift
//  CurrentWeatherTests
//
//  Created by Teeramet on 31/8/2563 BE.
//  Copyright © 2563 Teeramet. All rights reserved.
//

import Foundation
import XCTest
@testable import CurrentWeather

class ForeCastWeatherWorkerTests: XCTestCase{

    
    func test_getWeathreSuccess(){
        let expectation = XCTestExpectation(description: "Get ForeCast API")
        
        let worker = ForeCastWorker(MockWeatherDataSource(success: true))
        
        worker.fetchForeCast("Bangkok", Units.Metric.rawValue, completionHandler: {(data , error) in
            XCTAssertNil(error)
            XCTAssertNotNil(data)
            expectation.fulfill()
        })
        
        
        wait(for: [expectation], timeout: 5)
    }
    
    
    func test_getWeathreFailed(){
        let expectation = XCTestExpectation(description: "Get ForeCast API")
        
        let worker = ForeCastWorker(MockWeatherDataSource(success: false))
        
        worker.fetchForeCast("", Units.Metric.rawValue, completionHandler: {(data , error) in
            XCTAssertNil(data)
            XCTAssertNotNil(error)
            expectation.fulfill()
        })
        wait(for: [expectation], timeout: 5)
    }
}
