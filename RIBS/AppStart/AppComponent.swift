//
//  AppComponent.swift
//  Holder
//
//  Created by Yeojin Yoon on 2022/04/05.
//

import UIKit
import RIBs

class AppComponent: Component<EmptyComponent>, RootDependency {
    var window: UIWindow!
    
    internal init(window: UIWindow) {
        self.window = window
        super.init(dependency: EmptyComponent())
    }
}
