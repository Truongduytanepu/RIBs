//
//  HomeViewController.swift
//  RIBS
//
//  Created by ADMIN on 3/24/25.
//

import RIBs
import RxSwift
import UIKit

protocol HomePresentableListener: AnyObject {
    func backToBeforeScreen()
    func pushToSecondScreen()
    func pushToThirdScreen()
}

final class HomeViewController: UIViewController, HomePresentable, HomeViewControllable {
    
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var secondBtn: UIButton!
    @IBOutlet weak var thirdBtn: UIButton!
    
    weak var listener: HomePresentableListener?
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func backBtnTapped(_ sender: Any) {
        self.listener?.backToBeforeScreen()
    }
    
    @IBAction func pushToSecondVCTapped(_ sender: Any) {
        self.listener?.pushToSecondScreen()
    }
    
    @IBAction func pushToThirdVCTapped(_ sender: Any) {
        self.listener?.pushToThirdScreen()
    }
}

