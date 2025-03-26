//
//  ThirdVCInteractor.swift
//  RIBS
//
//  Created by ADMIN on 3/25/25.
//

import RIBs
import RxSwift

protocol ThirdVCRouting: ViewableRouting {
}

protocol ThirdVCPresentable: Presentable {
    var listener: ThirdVCPresentableListener? { get set }
}

protocol ThirdVCListener: AnyObject {
}

final class ThirdVCInteractor: PresentableInteractor<ThirdVCPresentable>, ThirdVCInteractable, ThirdVCPresentableListener {

    weak var router: ThirdVCRouting?
    weak var listener: ThirdVCListener?

    override init(presenter: ThirdVCPresentable) {
        super.init(presenter: presenter)
        presenter.listener = self
    }

    override func didBecomeActive() {
        super.didBecomeActive()
    }

    override func willResignActive() {
        super.willResignActive()
    }
}
