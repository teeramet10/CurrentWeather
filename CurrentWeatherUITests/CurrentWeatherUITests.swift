//
//  CurrentWeatherUITests.swift
//  CurrentWeatherUITests
//
//  Created by Teeramet on 29/8/2563 BE.
//  Copyright © 2563 Teeramet. All rights reserved.
//

import XCTest

class CurrentWeatherUITests: XCTestCase {

   

    func testConvert() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        let convertToFahrenheitStaticText = app/*@START_MENU_TOKEN@*/.staticTexts["  Convert to Fahrenheit"]/*[[".buttons[\"  Convert to Fahrenheit\"].staticTexts[\"  Convert to Fahrenheit\"]",".staticTexts[\"  Convert to Fahrenheit\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        convertToFahrenheitStaticText.tap()
        let convertToCelsiusStaticText = app/*@START_MENU_TOKEN@*/.staticTexts["  Convert to Celsius"]/*[[".buttons[\"  Convert to Celsius\"].staticTexts[\"  Convert to Celsius\"]",".staticTexts[\"  Convert to Celsius\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        convertToCelsiusStaticText.tap()
      
        
        
    }
    
    func testEnterCity() {
        let app = XCUIApplication()
        app.launch()
      
        let textField = app.textFields["Enter the city"]
        textField.tap()
        if let value = textField.value as? String{
            let deleteString = String(repeating: XCUIKeyboardKey.delete.rawValue, count: value.count)
            textField.typeText(deleteString)
        }

        textField.typeText("Japan")
        app.buttons["ic search"].tap()
    }
    
    func testEnterCityEmpty() {
        let app = XCUIApplication()
        app.launch()
      
        let textField = app.textFields["Enter the city"]
        textField.tap()
        textField.typeText("")
        app.buttons["ic search"].tap()
    }
    
    func testNavigateToForeCast(){
        let app = XCUIApplication()
        app.launch()
        app.navigationBars["Weather"].buttons["Forecast"].tap()
        
    }
   
  
}
