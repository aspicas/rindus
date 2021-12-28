//
//  MainTabBarViewController.swift
//  rindus
//
//  Created by David Alejandro Garcia Ruiz on 16/12/21.
//

import UIKit

class MainTabBarViewController: UITabBarController {
    
    private var views: [UIViewController] = []
    
    init(_ views: [UIViewController]) {
        self.views = views
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        tabBar.backgroundColor = .white
        viewControllers = views
    }

}
