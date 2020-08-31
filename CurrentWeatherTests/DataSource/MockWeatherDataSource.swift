//
//  MockWeatherDataSource.swift
//  CurrentWeather
//
//  Created by Teeramet on 29/8/2563 BE.
//  Copyright © 2563 Teeramet. All rights reserved.
//

import Foundation
import RxSwift
@testable import CurrentWeather
class MockWeatherDataSource : WeatherDataSourceProtocol{
    
    
    var success : Bool
    
    init(success : Bool) {
        self.success = success
    }
    
    func getWeather(_ cityName: String,_ unit : String)  -> Observable<CountryWeatherModel> {
        if success {
            let model : CountryWeatherModel = CountryWeatherModel.init(JSONString: MockGetWeatherCityJSONResponse.jsonSuccess) ?? CountryWeatherModel()
             return Observable.just(model)
        }else{
            let model : CountryWeatherModel = CountryWeatherModel.init(JSONString: MockGetWeatherCityJSONResponse.jsonFailed) ??  CountryWeatherModel()
            return Observable.error(ResponseError.init(model.message))
        }
    }
    
    func getForeCastWeather(_ cityName: String, unit: String) -> Observable<ForeCastWeatherListModel> {
        
        if success {
            let model : ForeCastWeatherListModel = ForeCastWeatherListModel.init(JSONString: MockGetForeCastWeatherJSONResponse.jsonSuccess) ?? ForeCastWeatherListModel()
            return Observable.just(model)

        }else{
            let model : ForeCastWeatherListModel = ForeCastWeatherListModel.init(JSONString: MockGetForeCastWeatherJSONResponse.jsonFailed) ?? ForeCastWeatherListModel()
            return Observable.error(ResponseError.init(model.message))
        }
        
    }
    
}

