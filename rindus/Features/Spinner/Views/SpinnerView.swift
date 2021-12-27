//
//  SpinnerView.swift
//  rindus
//
//  Created by David Alejandro Garcia Ruiz on 17/12/21.
//

import UIKit
import SnapKit

class SpinnerView: UIView {

    private lazy var spinnerIndivatorView: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .large)
        return spinner
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSpinner()
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addSpinner()
    }
    
    private func addSpinner() {
        self.addSubview(spinnerIndivatorView)
        spinnerIndivatorView.snp.makeConstraints { make in
            make.center.equalTo(self)
        }
        spinnerIndivatorView.startAnimating()
    }
    
    func setSpinnerColor(_ color: UIColor) {
        spinnerIndivatorView.color = color
    }
    
}
