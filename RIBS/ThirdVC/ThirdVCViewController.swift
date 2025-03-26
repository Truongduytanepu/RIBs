//
//  ThirdVCViewController.swift
//  RIBS
//
//  Created by ADMIN on 3/25/25.
//

import RIBs
import RxSwift
import UIKit

protocol ThirdVCPresentableListener: AnyObject {
}

final class ThirdVCViewController: UIViewController, ThirdVCPresentable, ThirdVCViewControllable {
    weak var listener: ThirdVCPresentableListener?
}
