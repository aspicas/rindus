//
//  MainWeatherViewController.swift
//  rindus
//
//  Created by David Garcia on 28/12/21.
//

import UIKit


class MainWeatherViewController: UIViewController {

    lazy var cityLabel: UILabel = {
        var label = UILabel()
        label.textAlignment = .center
        label.font = UIFont(descriptor: .preferredFontDescriptor(withTextStyle: .title3), size: 14)
        label.textColor = .black
        return label
    }()
    
    lazy var tempLabel: UILabel = {
        var label = UILabel()
        label.textAlignment = .center
        label.font = UIFont(descriptor: .preferredFontDescriptor(withTextStyle: .title1), size: 18)
        label.textColor = .black
        return label
    }()
    
    lazy var mainTextLabel: UILabel = {
        var label = UILabel()
        label.textAlignment = .center
        label.font = UIFont(descriptor: .preferredFontDescriptor(withTextStyle: .body), size: 12)
        label.textColor = .black
        return label
    }()
    
    lazy var tableView: UITableView = {
        var table = UITableView()
        table.bounces = false
        table.showsHorizontalScrollIndicator = false
        table.separatorStyle = .none
        return table
    }()
    
    override func loadView() {
        super.loadView()
        view.addSubview(cityLabel)
        view.addSubview(tempLabel)
        view.addSubview(mainTextLabel)
        view.addSubview(tableView)
        
        cityLabel.snp.makeConstraints { make in
            make.left.equalTo(view).offset(5)
            make.right.equalTo(view).offset(-5)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(10)
        }
        
        tempLabel.snp.makeConstraints { make in
            make.left.equalTo(view).offset(5)
            make.right.equalTo(view).offset(-5)
            make.top.equalTo(cityLabel.snp.bottom).offset(5)
        }
        
        mainTextLabel.snp.makeConstraints { make in
            make.left.equalTo(view).offset(5)
            make.right.equalTo(view).offset(-5)
            make.top.equalTo(tempLabel.snp.bottom).offset(5)
        }
        
        tableView.snp.makeConstraints { make in
            make.left.equalTo(view).offset(5)
            make.right.equalTo(view).offset(-5)
            make.top.equalTo(mainTextLabel.snp.bottom).offset(10)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cityLabel.text = "Zaragoza"
        tempLabel.text = "10º"
        mainTextLabel.text = "Cloud"
        setupTableView()
    }
    
    private func setupTableView() {
        tableView.register(DailyWeatherTableViewCell.self,
                           forCellReuseIdentifier: "DailyWeatherTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension MainWeatherViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView
            .dequeueReusableCell(withIdentifier: "DailyWeatherTableViewCell",
                                 for: indexPath) as! DailyWeatherTableViewCell
        cell.setupContent(title: "Sat, Jan 1", temp: "10º", description: "Cloud")
        return cell
    }
}
