//
//  RootBuilder.swift
//
//
//  Created by Thanh Vu on 09/08/2021.
//

import Foundation
import UIKit

import RIBs

public extension ViewControllable {
    func push(viewControllable: ViewControllable, animated: Bool = true, completion: (() -> Void)? = nil) {
        print("viewController: \(self.uiviewController)")
        print("nav: \(String(describing: self.uiviewController.navigationController))")
        
        guard let navigation = self.uiviewController.navigationController else {
            print("không tìm được nav")
            return
        }
        
        CATransaction.begin()
        CATransaction.setCompletionBlock(completion)
        navigation.pushViewController(viewControllable.uiviewController, animated: animated)
        CATransaction.commit()
    }
    
    func pushWithPresentAnimation(viewControllable: ViewControllable) {
        guard let navigation = self.uiviewController.navigationController else {
            return
        }

        let transition = CATransition()
        transition.duration = 0.25
        transition.type = .moveIn
        transition.subtype = .fromTop
        transition.timingFunction = CAMediaTimingFunction(name: .easeOut)

        navigation.view.layer.add(transition, forKey: kCATransition)
        navigation.pushViewController(viewControllable.uiviewController, animated: false)
    }

    func present(viewControllable: ViewControllable, animated: Bool = true, completion: (() -> Void)? = nil) {
        let navigationController = BaseNavigationController(rootViewController: viewControllable.uiviewController)
        navigationController.modalPresentationStyle = viewControllable.uiviewController.modalPresentationStyle
        self.uiviewController.present(navigationController, animated: animated, completion: completion)
    }

    func popViewControllale(animated: Bool = true) {
        guard let navigation = self.uiviewController.navigationController else {
            return
        }

        navigation.popViewController(animated: animated)
    }

    func popTop(viewControllable: ViewControllable, animated: Bool = true) {
        guard let navigation = self.uiviewController.navigationController else {
            return
        }

        if navigation.topViewController == viewControllable.uiviewController {
            self.popViewControllale(animated: animated)
        }
    }

    func popToBefore(viewControllable: ViewControllable, animated: Bool = true, completion: (() -> Void)? = nil) {
        self.uiviewController.popToBefore(viewController: viewControllable.uiviewController, animated: animated, completion: completion)
    }

    func popToRoot(animated: Bool = true) {
        guard let navigation = self.uiviewController.navigationController else {
            return
        }

        navigation.popToRootViewController(animated: animated)
    }

    func dismiss(animated: Bool = true, completion: (() -> Void)? = nil) {
        if let navigation = self.uiviewController.navigationController {
            navigation.dismiss(animated: animated, completion: completion)
        } else {
            self.uiviewController.dismiss(animated: animated, completion: completion)
        }
    }
}
