//
//  BaseViewController.swift
//  CurrentWeather
//
//  Created by Teeramet on 30/8/2563 BE.
//  Copyright © 2563 Teeramet. All rights reserved.
//

import Foundation
import UIKit
class BaseViewController : UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupUI()
    }
    
    func setup(){
        
    }
    
    func setupUI(){
        
    }
    
    func displayAlert( _ message :String){
        let alert = UIAlertController.init(title: "", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction.init(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
