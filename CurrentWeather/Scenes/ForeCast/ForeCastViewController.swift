//
//  ForecastViewController.swift
//  CurrentWeather
//
//  Created by Teeramet on 29/8/2563 BE.
//  Copyright © 2563 Teeramet. All rights reserved.
//

import UIKit

class ForeCastViewController: BaseViewController {

    static let identifier = "ForeCastViewController"
    
    @IBOutlet weak var tableView: UITableView!
        
    var router : ForeCastRoutingProtocol?
       
    var interactor : ForeCastInteractorProtocol?
    
    var cityName :String?
    
    var unit :String?
    
    var displayList : [ForeCastGroupViewModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let request = ForeCast.FetchForeCast.Request(cityName: cityName ?? "", unit: unit ?? Units.Metric.rawValue)
        interactor?.fetchForeCast(request: request)
    }
    
    override func setupUI() {
        title = cityName
        tableView.register(ForeCastTableViewCell.nib, forCellReuseIdentifier: ForeCastTableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func setup() {
        let presenter = ForeCastPresenter()
        let interactor = ForeCastInteractor()
        let router = ForeCastRouter()
        router.viewController = self
        presenter.viewController = self
        interactor.presenter = presenter
        interactor.worker = ForeCastWorker(APIWeatherDataSource())
        self.interactor = interactor
        self.router = router
    }
}

extension ForeCastViewController : ForeCastViewControllerProtocol{
    func showForecastList(viewModel: ForeCast.FetchForeCast.ViewModel) {
        self.displayList = viewModel.displayList
              self.tableView.reloadData()
    }
  
    
    func showAlert(_ message: String) {
        self.displayAlert(message)
    }
}

extension ForeCastViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

extension ForeCastViewController : UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return displayList.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return displayList[section].list.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = ForeCastWeatherHeader()
        view.titleLabel.text = displayList[section].date
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ForeCastTableViewCell.identifier, for: indexPath) as? ForeCastTableViewCell else{
            return UITableViewCell()
        }
        let data = displayList[indexPath.section].list[indexPath.row]
        cell.setCell(data)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}
