//
//  DependencyInjectionContainer.swift
//  Road to Hollywood
//
//  Created by Miroslav Kutak on 22/11/21.
//

import Foundation

class DependencyInjectionContainer: ObservableObject {

    @Published var state: AuthenticationState = .signedOut
    lazy var authController: AuthenticationController = {
       return authControllerType.init(state: .init(get: {
           return self.state
       }, set: { state in
           self.state = state
       }))
    }()

    let documentActivityRepository: DocumentActivityRepository
    private let authControllerType: AuthenticationController.Type

    init(authControllerType: AuthenticationController.Type,
         documentChangeLogRepositoryType: DocumentActivityRepository.Type) {
        self.authControllerType = authControllerType
        self.documentActivityRepository = documentChangeLogRepositoryType.init()
    }
}
