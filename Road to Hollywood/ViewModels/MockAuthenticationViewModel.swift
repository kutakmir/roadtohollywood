//
//  MockAuthenticationViewModel.swift
//  Road to Hollywood
//
//  Created by Miroslav Kutak on 22/11/21.
//

import SwiftUI

class MockAuthenticationViewModel: AuthenticationViewModel {

    var state: Binding<AuthenticationState>

    /// Creates an instance of this view model.
    required init(state: Binding<AuthenticationState>) {
        self.state = state
    }

    func signIn() {
        self.state.wrappedValue = .signedIn(.mockTester1)
    }

    func disconnect() {
        self.state.wrappedValue = .signedOut
    }

    func signOut() {
        self.state.wrappedValue = .signedIn(.mockTester1)
    }
}
