//
//  ForecastProtocol.swift
//  CurrentWeather
//
//  Created by Teeramet on 29/8/2563 BE.
//  Copyright © 2563 Teeramet. All rights reserved.
//

import Foundation
protocol ForeCastInteractorProtocol {
    func fetchForeCast(_ cityName :String , _ unit:String)
}

protocol ForeCastPresenterProtocol {
    func showForeCastList(_ response : ForeCastWeatherListModel)
    func showError(_ error : Error)
}


protocol ForCastRoutingProtocol {
    
}

protocol ForeCastViewControllerProtocol {
    func showForecastList( _ list : [ForeCastGroupViewModel])
}
