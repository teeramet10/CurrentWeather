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
    
    var worker : ForeCastWorkerProtocol?
   
    func fetchForeCast(request :ForeCast.FetchForeCast.Request) {
        worker?.fetchForeCast(request.cityName,request.unit , completionHandler: {[weak self](data , error) in
            
            guard let strongSelf = self else{return}
            
            guard error == nil else{
                strongSelf.presenter?.showError(error ?? ResponseError.init("Can't get forecast."))
                return
            }
            
            let response = ForeCast.FetchForeCast.Response(foreCastModel: data)
            strongSelf.presenter?.showForeCastList(response: response)
            
        })
    }
    
    
    
    
}
