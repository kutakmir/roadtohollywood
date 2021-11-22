//
//  DependencyInjection.swift
//  Road to Hollywood
//
//  Created by Miroslav Kutak on 22/11/21.
//

import Foundation

class DependencyInjectionContainer: ObservableObject {

    @Published var state: AuthenticationState = .signedOut
    lazy var authViewModel: AuthenticationViewModel = {
       return authViewModelClass.init(state: .init(get: {
           return self.state
       }, set: { state in
           self.state = state
       }))
    }()

    let documentChangeLogRepository: DocumentChangeLogRepository
    private let authViewModelClass: AuthenticationViewModel.Type

    init(authViewModel: AuthenticationViewModel.Type,
         documentChangeLogRepository: DocumentChangeLogRepository) {
        self.authViewModelClass = authViewModel
        self.documentChangeLogRepository = documentChangeLogRepository
    }
}
