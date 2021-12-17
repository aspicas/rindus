//
//  MainWebRouter.swift
//  rindus
//
//  Created by David Alejandro Garcia Ruiz on 17/12/21.
//

import Foundation
import UIKit

class MainWebRouter {
    static func makeView(url: String) -> UIViewController {
        let controller = MainWebViewController()
        controller.urlString = url
        return controller
    }
}
