//
//  MainTabBarRouter.swift
//  rindus
//
//  Created by David Alejandro Garcia Ruiz on 17/12/21.
//

import Foundation
import UIKit

class MainTabBarRouter {
    static func makeView() -> MainTabBarViewController {
        let views = [MainWeatherRouter.makeView(),
                     MainWebRouter.makeView(url: "https://www.c-and-a.com")]
        for i in 0..<views.count {
            var tabBarItem: UITabBarItem
            switch i {
            case 0:
                tabBarItem = UITabBarItem(tabBarSystemItem: .history, tag: i)
            default:
                tabBarItem = UITabBarItem(tabBarSystemItem: .more, tag: i)
            }
            views[i].tabBarItem = tabBarItem
        }
        let controller = MainTabBarViewController(views)
        return controller
    }
}
