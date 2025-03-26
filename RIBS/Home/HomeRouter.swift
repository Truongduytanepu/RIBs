//
//  HomeRouter.swift
//  RIBS
//
//  Created by ADMIN on 3/24/25.
//

import RIBs

protocol HomeInteractable: Interactable, SecondVCListener, ThirdVCListener {
    var router: HomeRouting? { get set }
    var listener: HomeListener? { get set }
}

protocol HomeViewControllable: ViewControllable {
}

final class HomeRouter: ViewableRouter<HomeInteractable, HomeViewControllable>, HomeRouting {
    
    private let secondVCBuilder: SecondVCBuildable
    private var secondVCRouter: SecondVCRouting?
    private let thirdVCBuilder: ThirdVCBuildable
    private var thirdVCRouter: ThirdVCRouting?
    
    init(interactor: HomeInteractable,
                  viewController: HomeViewControllable,
         secondVCBuilder: SecondVCBuildable, thirdVCBuilder: ThirdVCBuildable) {
        self.secondVCBuilder = secondVCBuilder
        self.thirdVCBuilder = thirdVCBuilder
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }

    
    func backToBefore() {
        viewController.popViewControllale()
    }
    
    func pushToSecondVC() {
        let secondRouter = secondVCBuilder.build(withListener: interactor)
        attachChild(secondRouter)
        viewController.push(viewControllable: secondRouter.viewControllable)
        self.secondVCRouter = secondRouter
    }
    
    func pushToThirdVC() {
        let thirdRouter = thirdVCBuilder.build(withListener: interactor)
        attachChild(thirdRouter)
        viewController.push(viewControllable: thirdRouter.viewControllable)
    }
}
