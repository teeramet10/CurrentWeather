//
//  ViewController.swift
//  CurrentWeather
//
//  Created by Teeramet on 29/8/2563 BE.
//  Copyright © 2563 Teeramet. All rights reserved.
//

import UIKit

enum Units : String{
    case Metric = "metric" // Celsius
    case Imperial = "imperial" //Fahrenheit
}

class CurrentWeatherController: UIViewController {

    
    @IBOutlet weak var weatherImageView: UIImageView!
    @IBOutlet weak var cityTextfield: UITextField!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var convertTempButton: UIButton!
    @IBOutlet weak var container: UIView!
    
    var interactor : CurrentWeatherInteractorProtocol?
    
    var router : CurrentWeatherRoutingProtocol?
    
    var unit : Units = .Metric
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        setup()
        setupUI()
    }
    
    private func setupUI(){
        title = "Weather"
        container.layer.cornerRadius = 20
        self.interactor?.getCurrentWeather("Bangkok", unit.rawValue)
    }
    
    private func setup(){
        let presenter = CurrentWeatherPresenter()
        let interactor = CurrentWeatherInteractor()
        let router = CurrentWeatherRouter()
        router.viewController = self
        presenter.viewController = self
        interactor.presenter = presenter
        interactor.weatherRepository = WeatherRepository(APIWeatherDataSource())
        self.interactor = interactor
      
        self.router = router
    }

    @IBAction func toForeCastPage(_ sender: Any) {
        self.router?.routeToForeCast(cityTextfield.text ?? "")
    }
    
    
    @IBAction func onConvertTemp(_ sender: Any) {
        switch unit {
        case .Imperial:
            unit = .Metric
            self.interactor?.convertToCelsius()
        case .Metric:
            unit = .Imperial
            self.interactor?.convertToFahrenheit()
        }
       
    }
    
    @IBAction func onEnterCity(_ sender: Any) {
        self.interactor?.getCurrentWeather(cityTextfield.text ?? "",unit.rawValue)
    }
    
}


extension CurrentWeatherController : CurrentWeatherControllerProtocol{
    func displayWeather(_ viewModel : CountryWeatherViewModel) {
        cityTextfield.text = viewModel.city
        humidityLabel.text = viewModel.humidity
        temperatureLabel.text = viewModel.temp
        ImageUtils.loader( weatherImageView, viewModel.icon)
    }
    
    func convertWeatherSuccess(_ temperature : String) {
        temperatureLabel.text = temperature
    }
    
    
}
