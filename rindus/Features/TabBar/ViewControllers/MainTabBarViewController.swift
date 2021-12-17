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
        
        let x = UIViewController()
        x.view.backgroundColor = .magenta
        let icon1 = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        x.tabBarItem = icon1
        
        let y = UIViewController()
        y.view.backgroundColor = .blue
        let icon2 = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
        y.tabBarItem = icon2
        
        viewControllers = views
    }

}
