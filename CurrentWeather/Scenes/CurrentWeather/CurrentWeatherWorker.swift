//
//  CurrentWeatherWorker.swift
//  CurrentWeather
//
//  Created by Teeramet on 31/8/2563 BE.
//  Copyright © 2563 Teeramet. All rights reserved.
//

import Foundation
import RxSwift
class CurrentWeatherWorker : CurrentWeatherWorkerProtocol{
    
   
    var disposeBag = DisposeBag()
    
    var datasource : WeatherDataSourceProtocol
    
    init(_ datasource : WeatherDataSourceProtocol) {
        self.datasource = datasource
    }
    
    func getCurrentWeather(_ cityName: String, _ unit: String,completionHandler:@escaping (CountryWeatherModel?,Error?) -> Void) {
        datasource.getWeather(cityName,unit).bind().subscribe(onNext: { data in
            data.unit = unit
            completionHandler(data , nil)
            }, onError: {error in
                completionHandler(nil , error)
            }, onCompleted: nil, onDisposed: nil)
            .disposed(by: disposeBag)
        
    }
    
    

    
}
