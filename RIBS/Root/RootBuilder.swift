//
//  RootBuilder.swift
//  RIBS
//
//  Created by ADMIN on 3/24/25.
//

import RIBs

protocol RootDependency: Dependency {
    var window: UIWindow! { get }
}

protocol RootBuildable: Buildable {
    func build() -> RootRouting
}

final class RootComponent: Component<RootDependency> {}

final class RootBuilder: Builder<RootDependency>, RootBuildable {
    override init(dependency: RootDependency) {
        super.init(dependency: dependency)
    }

    func build() -> RootRouting {
        let viewController = RootViewController()
        let interactor = RootInteractor(presenter: viewController)
        let component = RootComponent(dependency: dependency)

        let loginBuilder = LoginBuilder(dependency: component)
        return RootRouter(interactor: interactor, viewController: viewController, window: dependency.window, loginBuilder: loginBuilder)
    }
}
