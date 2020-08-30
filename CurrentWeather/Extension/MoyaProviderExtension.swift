//
//  BaseApiClient.swift
//  CurrentWeather
//
//  Created by Teeramet on 29/8/2563 BE.
//  Copyright © 2563 Teeramet. All rights reserved.
//

import Foundation
import Moya
import RxSwift
import Moya_ObjectMapper

extension MoyaProvider{
    
    
    func requestAPI<Element:BaseResponse>( _ target : Target) -> Observable<Element>{
        let request = self.rx.request(target).debug()
        return request.flatMap({response in
                guard (200...299).contains(response.statusCode) else {
                    do{
                        let response = try response.mapObject(Element.self)
                        throw ResponseError(response.message ?? "")
                    }
                }
                return .just(response)
            })
            .filterSuccessfulStatusCodes().mapObject(Element.self).asObservable()

        
    }
}
