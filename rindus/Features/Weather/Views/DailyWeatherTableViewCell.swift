//
//  DailyWeatherTableViewCell.swift
//  rindus
//
//  Created by David Garcia on 28/12/21.
//

import UIKit
import SnapKit

class DailyWeatherTableViewCell: UITableViewCell {

    lazy var titleLabel: UILabel = {
        var label = UILabel()
        label.textAlignment = .left
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.textColor = .black
        return label
    }()
    
    lazy var tempLabel: UILabel = {
        var label = UILabel()
        label.textAlignment = .right
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.textColor = .black
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        var label = UILabel()
        label.textAlignment = .right
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.textColor = .black
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubview(titleLabel)
        self.addSubview(tempLabel)
        self.addSubview(descriptionLabel)
        
        titleLabel.snp.makeConstraints { make in
            make.left.equalTo(self).offset(5)
            make.centerY.equalTo(descriptionLabel)
            make.width.equalTo(100.0)
        }
        
        tempLabel.snp.makeConstraints { make in
            make.left.equalTo(titleLabel.snp.right).offset(2)
            make.centerY.equalTo(descriptionLabel)
            make.width.equalTo(50.0)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.left.equalTo(tempLabel.snp.right).offset(2)
            make.right.equalTo(self).offset(-5)
            make.top.equalTo(self).offset(10)
            make.bottom.equalTo(self).offset(-10)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupContent(title: String, temp: String, description: String) {
        titleLabel.text = title
        tempLabel.text = temp
        descriptionLabel.text = description
    }
}
