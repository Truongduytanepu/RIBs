//
//  ThirdVCBuilder.swift
//  RIBS
//
//  Created by ADMIN on 3/25/25.
//

import RIBs

protocol ThirdVCDependency: Dependency {

}

final class ThirdVCComponent: Component<ThirdVCDependency> {
}

// MARK: - Builder

protocol ThirdVCBuildable: Buildable {
    func build(withListener listener: ThirdVCListener) -> ThirdVCRouting
}

final class ThirdVCBuilder: Builder<ThirdVCDependency>, ThirdVCBuildable {

    override init(dependency: ThirdVCDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: ThirdVCListener) -> ThirdVCRouting {
        let component = ThirdVCComponent(dependency: dependency)
        let viewController = ThirdVCViewController()
        let interactor = ThirdVCInteractor(presenter: viewController)
        interactor.listener = listener
        return ThirdVCRouter(interactor: interactor, viewController: viewController)
    }
}
