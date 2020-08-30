//
//  NetworkError.swift
//  CurrentWeather
//
//  Created by Teeramet on 29/8/2563 BE.
//  Copyright © 2563 Teeramet. All rights reserved.
//

import Foundation
class ResponseError : Error{
    var describe : String? = ""
    
    init(_ describe :String?) {
        if describe != nil {
             self.describe = describe
        }else{
            self.describe = "failed"
        }
       
    }

    
    static func getError(error : Error) -> String{
        guard let err = error as? ResponseError else{
            return error.localizedDescription
        }
        return err.describe ?? ""
    }
}
