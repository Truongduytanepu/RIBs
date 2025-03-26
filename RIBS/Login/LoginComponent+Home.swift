//
//  LoginComponent+Home.swift
//  RIBS
//
//  Created by ADMIN on 3/25/25.
//

import RIBs

/// The dependencies needed from the parent scope of Login to provide for the Home scope.
// TODO: Update LoginDependency protocol to inherit this protocol.
protocol LoginDependencyHome: Dependency {
    // TODO: Declare dependencies needed from the parent scope of Login to provide dependencies
    // for the Home scope.
}

extension LoginComponent: HomeDependency {

    // TODO: Implement properties to provide for Home scope.
}
