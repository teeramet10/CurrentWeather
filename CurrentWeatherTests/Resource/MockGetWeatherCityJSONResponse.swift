//
//  GetWeatherCityResponse.swift
//  CurrentWeatherTests
//
//  Created by Teeramet on 30/8/2563 BE.
//  Copyright © 2563 Teeramet. All rights reserved.
//

import Foundation


struct GetWeatherCityResponse {
    var jsonSuccess = """
    {
        coord: {
            lon: 100.52,
            lat: 13.75,
            },
            weather: [
                {
                id: 804,
                main: "Clouds",
                description: "overcast clouds",
                icon: "04n",
                }
            ],
            base: "stations",
            main: {
                temp: 31.27,
                feels_like: 35.07,
                temp_min: 30,
                temp_max: 33.33,
                pressure: 1002,
                humidity: 71,
            },
            visibility: 10000,
            wind: {
                speed: 4.08,
                deg: 167,
            },
            clouds: {
                all: 95
            },
            dt: 1598788339,
            sys: {
                type: 3,
                id: 2003771,
                country: "TH",
                sunrise: 1598742388,
                sunset: 1598787063,
            },
            timezone: 25200,
            id: 1609350,
            name: "Bangkok",
            cod: 200,
        }
    """
    
    
    var jsonFailed = """
    {
        cod: "404",
        message: "city not found",
    }
    """
}
