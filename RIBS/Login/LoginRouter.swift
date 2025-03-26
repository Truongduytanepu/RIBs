//
//  LoginRouter.swift
//  RIBS
//
//  Created by ADMIN on 3/24/25.
//

import RIBs

protocol LoginInteractable: Interactable, HomeListener {
    var router: LoginRouting? { get set }
    var listener: LoginListener? { get set }
}

protocol LoginViewControllable: ViewControllable {
}

final class LoginRouter: ViewableRouter<LoginInteractable, LoginViewControllable>, LoginRouting {
    
    private let homeBuilder: HomeBuildable
    private var homeRouter: HomeRouting?
    
    init(interactor: LoginInteractable, viewController: LoginViewControllable, homeBuilder: HomeBuildable) {
        self.homeBuilder = homeBuilder
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
    
    func routetoHome() {
        let homeRouter = homeBuilder.build(withListener: interactor)
        attachChild(homeRouter)
        viewController.push(viewControllable: homeRouter.viewControllable)
        self.homeRouter = homeRouter
    }
}
