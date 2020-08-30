//
//  WeatherService.swift
//  CurrentWeather
//
//  Created by Teeramet on 29/8/2563 BE.
//  Copyright © 2563 Teeramet. All rights reserved.
//

import Foundation
import Moya

enum WeatherService{
    case currentWeather(_ city : String , _ unit :String)
    case foreCast(_ city:String , _ unit :String)
}


extension WeatherService : TargetType{
    
    static let appId = "78c70fe2193117b99a8d0c5916ed0d05"
    static let baseURL = "http://api.openweathermap.org/data/2.5/"
    var method: Moya.Method {
        switch self {
        case .currentWeather(_,_):
            return .get
        case .foreCast(_,_):
            return .get
        }
    }
    
    var sampleData: Data {
        return "".data(using: .utf8)!
    }
    
    var task: Task {
        switch self {
        case .currentWeather(let city , let unit):
            return .requestParameters(parameters: ["q":city , "appid" : WeatherService.appId, "units" : unit], encoding: URLEncoding.queryString)
        case .foreCast(let city, let unit):
            return .requestParameters(parameters: ["q":city ,"appid" : WeatherService.appId,"units" : unit], encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        return ["Content-type" : "application/json"]
    }
    
    var baseURL:URL{
        return URL(string: WeatherService.baseURL)!
    }
    
    var path : String{
        switch self {
        case .currentWeather(_ , _):
            return "weather"
        case .foreCast(_, _):
            return "forecast"
        }
    }
}
