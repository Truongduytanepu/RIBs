//
//  SecondVCRouter.swift
//  RIBS
//
//  Created by ADMIN on 3/25/25.
//

import RIBs

protocol SecondVCInteractable: Interactable {
    var router: SecondVCRouting? { get set }
    var listener: SecondVCListener? { get set }
}

protocol SecondVCViewControllable: ViewControllable {
}

final class SecondVCRouter: ViewableRouter<SecondVCInteractable, SecondVCViewControllable>, SecondVCRouting {
    
    override init(interactor: SecondVCInteractable, viewController: SecondVCViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}
