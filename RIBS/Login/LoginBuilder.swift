//
//  LoginBuilder.swift
//  RIBS
//
//  Created by ADMIN on 3/24/25.
//

import RIBs

protocol LoginDependency: Dependency {

}

final class LoginComponent: Component<LoginDependency> {
    override init(dependency: LoginDependency) {
        super.init(dependency: dependency)
    }
}

// MARK: - Builder

protocol LoginBuildable: Buildable {
    func build(withListener listener: LoginListener) -> LoginRouting
}

final class LoginBuilder: Builder<LoginDependency>, LoginBuildable {

    override init(dependency: LoginDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: LoginListener) -> LoginRouting {
        let component = LoginComponent(dependency: dependency)
        let viewController = LoginViewController()
        let interactor = LoginInteractor(presenter: viewController)
        let homeBuilder = HomeBuilder(dependency: component)
        interactor.listener = listener
        return LoginRouter(interactor: interactor, viewController: viewController, homeBuilder: homeBuilder)
    }
}
