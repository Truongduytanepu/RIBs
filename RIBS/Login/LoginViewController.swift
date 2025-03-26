//
//  LoginViewController.swift
//  RIBS
//
//  Created by ADMIN on 3/24/25.
//

import RIBs
import RxSwift
import UIKit

protocol LoginPresentableListener: AnyObject {
    func login(username: String, password: String)
}

final class LoginViewController: UIViewController, LoginPresentable, LoginViewControllable {
    
    @IBOutlet private weak var usernameTF: UITextField!
    @IBOutlet private weak var loginBtn: UIButton!
    @IBOutlet private weak var passwordTF: UITextField!
    
    weak var listener: LoginPresentableListener?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
    @IBAction func loginBtnTapped(_ sender: Any) {
        self.listener?.login(username: usernameTF.text ?? "", password: passwordTF.text ?? "")
    }
    
}
