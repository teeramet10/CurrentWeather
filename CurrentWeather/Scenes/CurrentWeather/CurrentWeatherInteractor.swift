//
//  CurrentWeatherInteractor.swift
//  CurrentWeather
//
//  Created by Teeramet on 29/8/2563 BE.
//  Copyright © 2563 Teeramet. All rights reserved.
//

import Foundation
import Moya
import RxSwift


class CurrentWeatherInteractor  : CurrentWeatherInteractorProtocol{
    
    var presenter : CurrentWeatherPresenterProtocol?
    
    var weatherRepository : WeatherRepositoryProtocol?
    
    var disposeBag = DisposeBag()
    
    func getCurrentWeather(_ cityName :String , _ unit :String) {
        weatherRepository?.getWeather(cityName,unit).bind().subscribe(onNext: {[weak self]response in
            guard let strongSelf = self else{return}
            strongSelf.presenter?.showWeather(response)
            }, onError: {[weak self] error in
                guard let strongSelf = self else{return}
                strongSelf.presenter?.showError(error)
            }, onCompleted: nil, onDisposed: nil)
            .disposed(by: disposeBag)
    }
    
    func convertToCelsius() {
//         = [°C] × 9 / 5 + 32
    }
    
    func convertToFahrenheit() {
//         = ([F] - 32) × 5/9
    }

}
