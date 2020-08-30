//
//  ForeCastTableViewCell.swift
//  CurrentWeather
//
//  Created by Teeramet on 29/8/2563 BE.
//  Copyright © 2563 Teeramet. All rights reserved.
//

import UIKit

class ForeCastTableViewCell: UITableViewCell {

    static let identifier = "ForeCastTableViewCell"
    static let nib = UINib(nibName: ForeCastTableViewCell.identifier, bundle: nil)
    
    private let imageURL = "http://openweathermap.org/img/wn/"
    
    @IBOutlet weak var container: UIView!
   
    @IBOutlet weak var tempImageView: UIImageView!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var mainLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        container.layer.shadowRadius = 10
        container.layer.shadowColor = UIColor.gray.cgColor
        container.layer.shadowOpacity = 0.4
        container.layer.shadowOffset = CGSize(width: 0, height: 5)
        container.layer.cornerRadius = 20
    }
    
    func setCell( _ data : ForeCastWeatherViewModel){
        ImageUtils.loader(tempImageView, data.icon)
        tempLabel.text = data.temperature
        mainLabel.text = data.title
        descriptionLabel.text = data.description
    }

    
}
