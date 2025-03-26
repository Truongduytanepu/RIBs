//
//  HomeBuilder.swift
//  RIBS
//
//  Created by ADMIN on 3/24/25.
//

import RIBs

protocol HomeDependency: Dependency {

}

final class HomeComponent: Component<HomeDependency> {
}

// MARK: - Builder

protocol HomeBuildable: Buildable {
    func build(withListener listener: HomeListener) -> HomeRouting
}

final class HomeBuilder: Builder<HomeDependency>, HomeBuildable {

    override init(dependency: HomeDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: HomeListener) -> HomeRouting {
        let component = HomeComponent(dependency: dependency)
        let viewController = HomeViewController()
        let interactor = HomeInteractor(presenter: viewController)
        let secondVC = SecondVCBuilder(dependency: component)
        let thirdVC = ThirdVCBuilder(dependency: component)
        interactor.listener = listener
        return HomeRouter(interactor: interactor, viewController: viewController, secondVCBuilder: secondVC, thirdVCBuilder: thirdVC)
    }
}
