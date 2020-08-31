//
//  ForeCastWorker.swift
//  CurrentWeather
//
//  Created by Teeramet on 31/8/2563 BE.
//  Copyright © 2563 Teeramet. All rights reserved.
//

import Foundation
import RxSwift
class ForeCastWorker : ForeCastWorkerProtocol{
    
    var disposeBag = DisposeBag()
    
    var datasource : WeatherDataSourceProtocol
    
    init(_ datasource : WeatherDataSourceProtocol) {
        self.datasource = datasource
    }
    
    func fetchForeCast(_ cityName: String, _ unit: String, completionHandler: @escaping (ForeCastWeatherListModel?, Error?) -> Void) {
        
        datasource.getForeCastWeather(cityName,unit: unit).bind().subscribe(onNext: {data in
            
            data.unit = unit
            completionHandler(data , nil)
            }, onError: {error in
                completionHandler(nil , error)
        }, onCompleted: nil, onDisposed: nil)
            .disposed(by: disposeBag)
    }
    
    
}
