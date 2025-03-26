//
//  HomeComponent+ThirdVC.swift
//  RIBS
//
//  Created by ADMIN on 3/25/25.
//

import RIBs

/// The dependencies needed from the parent scope of Home to provide for the ThirdVC scope.
// TODO: Update HomeDependency protocol to inherit this protocol.
protocol HomeDependencyThirdVC: Dependency {
    // TODO: Declare dependencies needed from the parent scope of Home to provide dependencies
    // for the ThirdVC scope.
}

extension HomeComponent: ThirdVCDependency {

    // TODO: Implement properties to provide for ThirdVC scope.
}
