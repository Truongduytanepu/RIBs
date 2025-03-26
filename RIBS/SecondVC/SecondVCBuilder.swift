//
//  SecondVCBuilder.swift
//  RIBS
//
//  Created by ADMIN on 3/25/25.
//

import RIBs

protocol SecondVCDependency: Dependency {

}

final class SecondVCComponent: Component<SecondVCDependency> {
}

// MARK: - Builder

protocol SecondVCBuildable: Buildable {
    func build(withListener listener: SecondVCListener) -> SecondVCRouting
}

final class SecondVCBuilder: Builder<SecondVCDependency>, SecondVCBuildable {

    override init(dependency: SecondVCDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: SecondVCListener) -> SecondVCRouting {
        let component = SecondVCComponent(dependency: dependency)
        let viewController = SecondVCViewController()
        let interactor = SecondVCInteractor(presenter: viewController)
        interactor.listener = listener
        return SecondVCRouter(interactor: interactor, viewController: viewController)
    }
}
