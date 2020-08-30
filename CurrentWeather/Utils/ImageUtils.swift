//
//  ImageUtils.swift
//  CurrentWeather
//
//  Created by Teeramet on 30/8/2563 BE.
//  Copyright © 2563 Teeramet. All rights reserved.
//

import Foundation
import Kingfisher
class ImageUtils{
    
    
    static func loader(_ imageView : UIImageView , _ path :String){
        guard let url = URL(string: path) else{return}
        imageView.kf.setImage(with: url)
    }
}
