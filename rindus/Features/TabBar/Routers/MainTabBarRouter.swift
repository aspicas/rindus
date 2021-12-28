//
//  MainTabBarRouter.swift
//  rindus
//
//  Created by David Alejandro Garcia Ruiz on 17/12/21.
//

import Foundation

class MainTabBarRouter {
    static func makeView() -> MainTabBarViewController {
        let views = [MainWeatherRouter.makeView(),
                     MainWebRouter.makeView(url: "https://www.c-and-a.com")]
        let controller = MainTabBarViewController(views)
        return controller
    }
}
