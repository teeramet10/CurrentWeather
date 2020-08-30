//
//  MockForeCastViewController.swift
//  CurrentWeatherTests
//
//  Created by Teeramet on 31/8/2563 BE.
//  Copyright © 2563 Teeramet. All rights reserved.
//

import Foundation
@testable import CurrentWeather
import XCTest
class MockForeCastViewController  : ForeCastViewControllerProtocol{
   
    var showForecastListCalled = false
    var showAlertCalled = false
    var displayAlert = ""
    var viewModel : ForeCast.FetchForeCast.ViewModel?
    func showForecastList(viewModel: ForeCast.FetchForeCast.ViewModel) {
        self.viewModel = viewModel
        showForecastListCalled = true
    }
    
    func showAlert(_ message: String) {
        showAlertCalled = true
        displayAlert = message
    }
    
    
}
