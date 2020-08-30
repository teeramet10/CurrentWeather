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
    
    func fetchForeCast(request :ForeCast.FetchForeCast.Request) {
        weatherRepository?.getForeCastWeathre(request.cityName,request.unit).bind().subscribe(onNext: {[weak self]data in
          
            guard let strongSelf = self else{return}
            
            let response = ForeCast.FetchForeCast.Response(foreCastModel: data)
            strongSelf.presenter?.showForeCastList(response: response)
            
            }, onError: {[weak self] error in
                guard let strongSelf = self else{return}
                strongSelf.presenter?.showError(error)
            }, onCompleted: nil, onDisposed: nil)
            .disposed(by: disposeBag)
    }
    
    
    
    
}
