//
//  RootRouter.swift
//  RIBS
//
//  Created by ADMIN on 3/24/25.
//

import RIBs

protocol RootInteractable: Interactable, LoginListener {
    var router: RootRouting? { get set }
    var listener: RootListener? { get set }
}

protocol RootViewControllable: ViewControllable {
}

final class RootRouter: ViewableRouter<RootInteractable, RootViewControllable>, RootRouting {
    
    private let loginBuilder: LoginBuildable
    private var loginRouter: LoginRouting?
    private var window: UIWindow?
    
    init(interactor: RootInteractable, viewController: RootViewControllable, window: UIWindow, loginBuilder: LoginBuildable) {
        self.window = window
        self.loginBuilder = loginBuilder
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
    
    func routeToLogin() {
        let loginRouter = loginBuilder.build(withListener: interactor)
        let navigationController = BaseNavigationController(rootViewController: loginRouter.viewControllable.uiviewController)
        attachChild(loginRouter)
        self.window?.makeKeyAndVisible()
        self.window?.rootViewController = navigationController
        self.loginRouter = loginRouter
    }
}
