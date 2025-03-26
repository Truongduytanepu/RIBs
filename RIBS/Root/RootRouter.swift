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

final class RootRouter: LaunchRouter<RootInteractable, RootViewControllable>, RootRouting {
    
    private let loginBuilder: LoginBuildable
    private var loginRouter: LoginRouting?
    
    init(interactor: RootInteractable, viewController: RootViewControllable, loginBuilder: LoginBuildable) {
        self.loginBuilder = loginBuilder
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
    
    func routeToLogin() {
        let loginRouter = loginBuilder.build(withListener: interactor)
        attachChild(loginRouter)

        if let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let window = scene.windows.first {
            
            window.rootViewController = BaseNavigationController(rootViewController: loginRouter.viewControllable.uiviewController)
            window.makeKeyAndVisible()
        }
        
        self.loginRouter = loginRouter
    }

}
