//
//  ForecastProtocol.swift
//  CurrentWeather
//
//  Created by Teeramet on 29/8/2563 BE.
//  Copyright © 2563 Teeramet. All rights reserved.
//

import Foundation
protocol ForeCastInteractorProtocol : class {
    func fetchForeCast(request : ForeCast.FetchForeCast.Request)
}

protocol ForeCastPresenterProtocol : class {
    func showForeCastList(response : ForeCast.FetchForeCast.Response)
    func showError(_ error : Error)
}


protocol ForeCastRoutingProtocol : class{
    
}

protocol ForeCastViewControllerProtocol :class {
    func showForecastList(viewModel : ForeCast.FetchForeCast.ViewModel)
    func showAlert(_ message : String)
}
