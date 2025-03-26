//
//  ThirdVCRouter.swift
//  RIBS
//
//  Created by ADMIN on 3/25/25.
//

import RIBs

protocol ThirdVCInteractable: Interactable {
    var router: ThirdVCRouting? { get set }
    var listener: ThirdVCListener? { get set }
}

protocol ThirdVCViewControllable: ViewControllable {
}

final class ThirdVCRouter: ViewableRouter<ThirdVCInteractable, ThirdVCViewControllable>, ThirdVCRouting {
    
    override init(interactor: ThirdVCInteractable, viewController: ThirdVCViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}
