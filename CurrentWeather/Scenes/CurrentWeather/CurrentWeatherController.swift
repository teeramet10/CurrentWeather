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

class CurrentWeatherController: BaseViewController {
    
    static let identifier = "CurrentWeatherController"
    
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
        
        fetchWeather()
    }
    
    func fetchWeather(){
        let request = CurrentWeather.FetchWeather.Request(cityName: "Bangkok", units: unit.rawValue)
        self.interactor?.getCurrentWeather(request: request)
    }
    
    override func setupUI(){
        title = "Weather"
        cityTextfield.delegate = self
        weatherImageView.layer.cornerRadius = 75
        setButton()
    }
    
    func setButton(){
        let units = unit == .Metric ? "Fahrenheit" : "Celsius"
        convertTempButton.setTitle("  Convert to \(units)", for: .normal)
    }
    
    override func setup(){
        let presenter = CurrentWeatherPresenter()
        let interactor = CurrentWeatherInteractor()
        let router = CurrentWeatherRouter()
        router.viewController = self
        presenter.viewController = self
        interactor.presenter = presenter
        interactor.workers = CurrentWeatherWorker(APIWeatherDataSource())
        self.interactor = interactor
        
        self.router = router
    }
    
    @IBAction func toForeCastPage(_ sender: Any) {
        self.router?.routeToForeCast(cityTextfield.text ?? "",unit.rawValue)
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
        setButton()
        
    }
    
    @IBAction func onEnterCity(_ sender: Any) {
        view.endEditing(true)
        let request = CurrentWeather.FetchWeather.Request(cityName: cityTextfield.text ?? "", units: unit.rawValue)
        self.interactor?.getCurrentWeather(request: request)
    }
    
}

extension CurrentWeatherController : UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }
}


extension CurrentWeatherController : CurrentWeatherControllerProtocol{
    func displayWeather(_ viewModel: CurrentWeather.FetchWeather.ViewModel) {
        let weather = viewModel.weather
        cityTextfield.text = weather.city
        humidityLabel.text = weather.humidity
        temperatureLabel.text = weather.temp
        ImageUtils.loader( weatherImageView, weather.icon)
    }
    
    func showAlert(_ message: String) {
        displayAlert(message)
    }
    
    func displayConvertWeather(_ viewModel : CurrentWeather.ConvertWeather.ViewModel){
        temperatureLabel.text = viewModel.temperatureText
    }
    
}
