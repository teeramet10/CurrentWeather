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

extension MoyaProvider{
    
    func requestAPI<E:BaseResponse>( _ target : Target) -> Observable<E>{
        let request = self.rx.request(target).debug()
        return request
            .flatMap({response in
                guard (200...299).contains(response.statusCode) else {
                    do{
                        let response = try response.map(E.self)
                        throw ResponseError(response.message ?? "")
                    }
                }
                return .just(response)
            })
            .filterSuccessfulStatusCodes()
            .map(E.self, atKeyPath: nil, using: JSONDecoder.init(), failsOnEmptyData: true).asObservable()
        
    }
}
