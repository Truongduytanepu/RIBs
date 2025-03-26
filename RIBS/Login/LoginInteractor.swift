//
//  LoginInteractor.swift
//  RIBS
//
//  Created by ADMIN on 3/24/25.
//

import RIBs
import RxSwift

protocol LoginRouting: ViewableRouting {
    func routetoHome()
}

protocol LoginPresentable: Presentable {
    var listener: LoginPresentableListener? { get set }
}

protocol LoginListener: AnyObject {
}

final class LoginInteractor: PresentableInteractor<LoginPresentable>, LoginInteractable, LoginPresentableListener {

    weak var router: LoginRouting?
    weak var listener: LoginListener?

    override init(presenter: LoginPresentable) {
        super.init(presenter: presenter)
        presenter.listener = self
    }

    override func didBecomeActive() {
        super.didBecomeActive()
    }

    override func willResignActive() {
        super.willResignActive()
    }
    
    func login(username: String, password: String) {
        if username == "truongduytan" && password == "123456" {
            router?.routetoHome()
        } else {
            print("Login Failure")
        }
    }
}
