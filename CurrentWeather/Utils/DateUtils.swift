//
//  DateUtils.swift
//  CurrentWeather
//
//  Created by Teeramet on 30/8/2563 BE.
//  Copyright © 2563 Teeramet. All rights reserved.
//

import Foundation
class DateUtils{
    
    static let serviceFormat = "yyyy-MM-dd HH:mm:ss"
    
    static func convertToFormat(format : String = DateUtils.serviceFormat, newFormat:String , date :String) -> String{
        guard  date != "" else{return ""}
        
        let serverDateFormat = DateFormatter.init(withFormat: format, locale: Locale.current.identifier)
        
        guard let dateConvert = serverDateFormat.date(from: date) else{return ""}
        
        let dateFormat = DateFormatter.init(withFormat: newFormat, locale: Locale.current.identifier)
        
        return dateFormat.string(from: dateConvert) 
    }
}
