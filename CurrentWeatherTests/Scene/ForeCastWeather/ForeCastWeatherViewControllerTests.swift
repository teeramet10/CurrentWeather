//
//  ForeCastWeatherViewControllerTests.swift
//  CurrentWeatherTests
//
//  Created by Teeramet on 31/8/2563 BE.
//  Copyright © 2563 Teeramet. All rights reserved.
//

import Foundation

import XCTest
@testable import CurrentWeather
class ForeCastWeatherViewControllerTests : XCTestCase{
    
    class MockTableView : UITableView{
        var reloadDataCalled = false
        
        override func reloadData() {
            reloadDataCalled = true
        }
    }
    
    var viewController : ForeCastViewController!
    
    var window : UIWindow!
    
    override func setUp() {
        super.setUp()
        window = UIWindow()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        viewController = storyboard.instantiateViewController(identifier: ForeCastViewController.identifier) as  ForeCastViewController
    }
    
    
    override func tearDown() {
        window = nil
        super.tearDown()
    }
    
    func loadView(){
        window.addSubview(viewController.view)
        RunLoop.current.run(until: Date())
    }
    
    
    func test_FetchData(){
        let tableView = MockTableView()
        viewController.tableView = tableView
        let list = [ForeCastGroupViewModel()]
        let viewModel = ForeCast.FetchForeCast.ViewModel(displayList: list)
        viewController.showForecastList(viewModel: viewModel)
        XCTAssertTrue(tableView.reloadDataCalled)
    }

}
