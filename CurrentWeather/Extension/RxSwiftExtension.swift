//
//  RxSwiftExtension.swift
//  CurrentWeather
//
//  Created by Teeramet on 30/8/2563 BE.
//  Copyright © 2563 Teeramet. All rights reserved.
//

import Foundation
import RxSwift
extension Observable{
     func bind() -> Observable<Element>{
          return self.subscribeOn(ConcurrentDispatchQueueScheduler.init(qos: .background)).observeOn(MainScheduler.instance)
      }
}
