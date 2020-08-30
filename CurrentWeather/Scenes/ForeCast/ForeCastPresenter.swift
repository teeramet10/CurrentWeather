//
//  ForecastPresenter.swift
//  CurrentWeather
//
//  Created by Teeramet on 29/8/2563 BE.
//  Copyright © 2563 Teeramet. All rights reserved.
//

import Foundation


class ForeCastPresenter : ForeCastPresenterProtocol{
        
    weak var viewController : ForeCastViewControllerProtocol?
    
    func showError(_ error: Error) {
        let message = ResponseError.getError(error: error)
        viewController?.showAlert(message)
    }
    
    func showForeCastList(response : ForeCast.FetchForeCast.Response) {

 
        guard let data = response.foreCastModel else{
            viewController?.showAlert(response.foreCastModel?.message ?? "")
            return
        }
        
        guard data.code == "200" else{
            viewController?.showAlert(response.foreCastModel?.message ?? "")
            return
        }
        let model = response.foreCastModel
        let list = model?.list ?? []
        
        var displayList : [ForeCastGroupViewModel] = []
        
        var group = ForeCastGroupViewModel()
    
        list.forEach{data in
            let date = DateUtils.convertToFormat(newFormat: "EEE dd MMM yyyy", date: data.dateText ?? "")
            
            group.date =  group.date == "" ? date :  group.date
            
            let tempDate = group.date
            
            let weather =  data.weather?.first
            let icon = "http://openweathermap.org/img/wn/\( weather?.icon ?? "")@2x.png"
            
            let main = data.main
            let description = DateUtils.convertToFormat(newFormat: "HH:mm a", date: data.dateText ?? "")
            
            let unit = model?.unit == Units.Metric.rawValue ? "°C": "°F"
            
            let model = ForeCastWeatherViewModel(
                title: weather?.main ?? "",
                temperature: "\(main?.temp ?? 0) \(unit)",
                description: description,
                icon: icon)
       
            
            if tempDate == date{
                group.list.append(model)
            }else{
                group.list.append(model)
                displayList.append(group)
                group = ForeCastGroupViewModel()
            }
        }
        
        let viewModel = ForeCast.FetchForeCast.ViewModel(displayList:displayList)
        viewController?.showForecastList(viewModel: viewModel)
    }
    
    
}
