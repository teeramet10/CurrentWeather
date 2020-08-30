//
//  ForecastViewController.swift
//  CurrentWeather
//
//  Created by Teeramet on 29/8/2563 BE.
//  Copyright © 2563 Teeramet. All rights reserved.
//

import UIKit

class ForeCastViewController: UIViewController {

    static let identifier = "ForeCastViewController"
    
    @IBOutlet weak var tableView: UITableView!
    
    var interactor : ForeCastInteractorProtocol?
    
    var cityName :String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupTableView()
        
    }
    
    func setup(){
        title = cityName
    }
    
    func setupTableView(){
        tableView.register(ForeCastTableViewCell.nib, forCellReuseIdentifier: ForeCastTableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension ForeCastViewController : ForeCastViewControllerProtocol{
    func showForecastList() {
        
    }
    
    
}

extension ForeCastViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

extension ForeCastViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ForeCastTableViewCell.identifier, for: indexPath) as? ForeCastTableViewCell else{
            return UITableViewCell()
        }
        return cell
    }
    
    
}
