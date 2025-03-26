//
//  HomeComponent+SecondVC.swift
//  RIBS
//
//  Created by ADMIN on 3/25/25.
//

import RIBs

/// The dependencies needed from the parent scope of Home to provide for the SecondVC scope.
// TODO: Update HomeDependency protocol to inherit this protocol.
protocol HomeDependencySecondVC: Dependency {
    // TODO: Declare dependencies needed from the parent scope of Home to provide dependencies
    // for the SecondVC scope.
}

extension HomeComponent: SecondVCDependency {

    // TODO: Implement properties to provide for SecondVC scope.
}
