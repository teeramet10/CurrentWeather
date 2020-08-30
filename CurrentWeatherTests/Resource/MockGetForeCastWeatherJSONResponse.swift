//
//  MockGetForeCastWeatherJSONResponse.swift
//  CurrentWeatherTests
//
//  Created by Teeramet on 30/8/2563 BE.
//  Copyright © 2563 Teeramet. All rights reserved.
//

import Foundation
@testable import CurrentWeather
struct  MockGetForeCastWeatherJSONResponse{
    static let jsonSuccess = """
    {
        "cod": "200",
        "message": 0,
        "cnt": 40,
        "list": [
            {
                "dt": 1598788800,
                "main": {
                    "temp": 31.88,
                    "feels_like": 34.65,
                    "temp_min": 31.57,
                    "temp_max": 31.88,
                    "pressure": 1002,
                    "sea_level": 1003,
                    "grnd_level": 1002,
                    "humidity": 62,
                    "temp_kf": 0.31,
                },
                "weather": [
                    {
                        "id": 500,
                        "main": "Rain",
                        "description": "light rain",
                        "icon": "10n",
                    }
                ],
                "clouds": {
                    "all": 94
                },
                "wind": {
                    "speed": 4.08,
                    "deg": 167,
                },
                "visibility": 10000,
                "pop": 0.68,
                "rain": {
                    "3h": 0.48
                },
                "sys": {
                    "pod": "n"
                },
                "dt_txt": "2020-08-30 12:00:00",
            },
            {
                "dt": 1598799600,
                "main": {
                    "temp": 30.64,
                    "feels_like": 32.91,
                    "temp_min": 30.22,
                    "temp_max": 30.64,
                    "pressure": 1006,
                    "sea_level": 1007,
                    "grnd_level": 1005,
                    "humidity": 66,
                    "temp_kf": 0.42,
                },
                "weather": [
                    {
                        "id": 500,
                        "main": "Rain",
                        "description": "light rain",
                        "icon": "10n",
                    }
                ],
                "clouds": {
                    "all": 99
                },
                "wind": {
                    "speed": 4.69,
                    "deg": 165,
                },
                "visibility": 10000,
                "pop": 0.6,
                "rain": {
                    "3h": 0.15
                },
                "sys": {
                    "pod": "n"
                },
                "dt_txt": "2020-08-30 15:00:00",
            },
        ]
    }
    """
    
   static let jsonFailed = """
    {
        "cod": "404",
        "message": "city not found",
    }
    """
}
