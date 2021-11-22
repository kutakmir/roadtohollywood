//
//  AuthenticationViewModel.swift
//  Road to Hollywood
//
//  Created by Miroslav Kutak on 22/11/21.
//

import Foundation
import SwiftUI

/// An enumeration representing logged in status.
enum AuthenticationState {
    /// The user is logged in and is the associated value of this case.
    case signedIn(UserModel)
    /// The user is logged out.
    case signedOut
}

protocol AuthenticationViewModel {
    init(state: Binding<AuthenticationState>)
    func signIn()
    func disconnect()
    func signOut()
}
