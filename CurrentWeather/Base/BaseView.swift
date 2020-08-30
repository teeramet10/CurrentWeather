//
//  BaseView.swift
//  CurrentWeather
//
//  Created by Teeramet on 30/8/2563 BE.
//  Copyright © 2563 Teeramet. All rights reserved.
//

import UIKit
@IBDesignable
class BaseView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
        self.initView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setupView()
        self.initView()
    }
    
    
    fileprivate func setupView() {
        let view = viewFromNibForClass()
        view.frame = bounds
        view.autoresizingMask = [
            UIView.AutoresizingMask.flexibleWidth,
            UIView.AutoresizingMask.flexibleHeight
        ]
        
        addSubview(view)
    }
    
    fileprivate func viewFromNibForClass() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nibName = String(describing: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        
        return view
    }
    
    func initView(){
        
    }
}
