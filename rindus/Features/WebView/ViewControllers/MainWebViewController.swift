//
//  MainWebViewController.swift
//  rindus
//
//  Created by David Alejandro Garcia Ruiz on 17/12/21.
//

import UIKit
import WebKit
import SnapKit

class MainWebViewController: UIViewController {

    private lazy var webView: WKWebView = {
        let webView = WKWebView()
        return webView
    }()
    
    private lazy var spinnerView: SpinnerView = {
        let spinnerView = SpinnerView()
        spinnerView.backgroundColor = .lightGray
        spinnerView.setSpinnerColor(.white)
        return spinnerView
    }()
    
    var urlString: String = ""

    override func loadView() {
        super.loadView()
        view.addSubview(webView)
        
        webView.snp.makeConstraints { make in
            make.left.equalTo(view.safeAreaLayoutGuide)
            make.right.equalTo(view.safeAreaLayoutGuide)
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupWebView()
    }
    
    private func setupWebView() {
        webView.navigationDelegate = self
        if let url = URL(string: urlString) {
            let request = URLRequest(url: url)
            webView.load(request)
        }
    }
}

extension MainWebViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        self.view.addSubview(spinnerView)
        spinnerView.snp.makeConstraints { make in
            make.left.equalTo(view)
            make.right.equalTo(view)
            make.top.equalTo(view)
            make.bottom.equalTo(view)
        }
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        spinnerView.removeFromSuperview()
    }
}
