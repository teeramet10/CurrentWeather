//
//  CurrentWeatherRouter.swift
//  CurrentWeather
//
//  Created by Teeramet on 29/8/2563 BE.
//  Copyright © 2563 Teeramet. All rights reserved.
//

import Foundation
import UIKit

class CurrentWeatherRouter : CurrentWeatherRoutingProtocol{
    
    weak var viewController : UIViewController?
    
    func routeToForeCast(_ cityName : String , _ unit:String) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: ForeCastViewController.identifier) as? ForeCastViewController else{return}
        vc.cityName = cityName
        vc.unit = unit
        viewController?.navigationController?.pushViewController(vc, animated: true)
    }
}
