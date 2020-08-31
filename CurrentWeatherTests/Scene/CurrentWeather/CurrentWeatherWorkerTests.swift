//
//  CurrentWeatherWorkerTests.swift
//  CurrentWeatherTests
//
//  Created by Teeramet on 31/8/2563 BE.
//  Copyright © 2563 Teeramet. All rights reserved.
//

import Foundation
import XCTest
@testable import CurrentWeather

class CurrentWeatherWorkerTests: XCTestCase{

    
    func test_getWeathreSuccess(){
        let expectation = XCTestExpectation(description: "Get Weather API")
        
        let worker = CurrentWeatherWorker(MockWeatherDataSource(success: true))
        
        worker.getCurrentWeather("Bangkok", Units.Metric.rawValue, completionHandler: {(data , error) in
            XCTAssertNil(error)
            XCTAssertNotNil(data)
            expectation.fulfill()
        })
        
        
        wait(for: [expectation], timeout: 5)
    }
    
    
    func test_getWeathreFailed(){
        let expectation = XCTestExpectation(description: "Get Weather API")
        
        let worker = CurrentWeatherWorker(MockWeatherDataSource(success: false))
        
        worker.getCurrentWeather("", Units.Metric.rawValue, completionHandler: {(data , error) in
            XCTAssertNil(data)
            XCTAssertNotNil(error)
            expectation.fulfill()
        })
        wait(for: [expectation], timeout: 5)
    }
}
