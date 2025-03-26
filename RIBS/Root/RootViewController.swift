//
//  RootViewController.swift
//  RIBS
//
//  Created by ADMIN on 3/24/25.
//

import RIBs
import UIKit

protocol RootPresentableListener: AnyObject {}

final class RootViewController: UIViewController, RootPresentable, RootViewControllable {

    weak var listener: RootPresentableListener?

    override func viewDidLoad() {
        super.viewDidLoad()
        print(" navigationController: \(String(describing: self.navigationController))")
    }
}
