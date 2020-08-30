//
//  ForecastInteractor.swift
//  CurrentWeather
//
//  Created by Teeramet on 29/8/2563 BE.
//  Copyright © 2563 Teeramet. All rights reserved.
//

import Foundation
import RxSwift

class ForeCastInteractor : ForeCastInteractorProtocol{
    var presenter : ForeCastPresenterProtocol?
    
    var weatherRepository : WeatherRepositoryProtocol?
    
    var disposeBag = DisposeBag()
    
    
    func fetchForeCast(_ cityName: String , _ unit:String) {
        weatherRepository?.getForeCastWeathre(cityName,unit).bind().subscribe(onNext: {[weak self]response in
            guard let strongSelf = self else{return}
            strongSelf.presenter?.showForeCastList(response)
            }, onError: {[weak self] error in
                guard let strongSelf = self else{return}
                strongSelf.presenter?.showError(error)
            }, onCompleted: nil, onDisposed: nil)
            .disposed(by: disposeBag)
    }
    
    
    
    
}
