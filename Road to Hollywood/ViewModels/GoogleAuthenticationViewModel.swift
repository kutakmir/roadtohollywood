/*
 * Copyright 2021 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import SwiftUI
import GoogleSignIn

/// A class conforming to `ObservableObject` used to represent a user's authentication status.
final class GoogleAuthenticationViewModel: ObservableObject, AuthenticationViewModel {
    /// The user's log in status.
    /// - note: This will publish updates when its value changes.
    var state: Binding<AuthenticationState>
    
    /// The user-authorized scopes.
    /// - note: If the user is logged out, then this will default to empty.
    private var authorizedScopes: [String] {
        if let user = GIDSignIn.sharedInstance.currentUser {
            return user.grantedScopes ?? []
        } else {
            return []
        }
    }

    private var hasReadScope: Bool {
        return authorizedScopes.contains(GooglePermissionScope.driveMetadataReadonly.rawValue)
    }

    /// Creates an instance of this view model.
    required init(state: Binding<AuthenticationState>) {
        self.state = state

        if let googleUser = GIDSignIn.sharedInstance.currentUser,
            let user = UserModel(googleUser: googleUser) {
            self.state.wrappedValue = .signedIn(user)
        } else {
            self.state.wrappedValue = .signedOut
        }

        GIDSignIn.sharedInstance.restorePreviousSignIn { user, error in
            if let googleUser = user, let user = UserModel(googleUser: googleUser) {
                self.state.wrappedValue = .signedIn(user)
            } else {
                self.state.wrappedValue = .signedOut
            }
        }
    }

    private let scopes = [GooglePermissionScope.driveMetadataReadonly.rawValue]
    private let clientID = "275300151551-sis0nn7um9t8bkfus9p6iipp3330ecm2.apps.googleusercontent.com"

    private lazy var configuration: GIDConfiguration = {
        return GIDConfiguration(clientID: clientID)
    }()

    /// Signs in the user based upon the selected account.'
    /// - note: Successful calls to this will set the `authViewModel`'s `state` property.
    func signIn() {

        guard let rootViewController = UIApplication.shared.keyWindow?.rootViewController else {
            print("There is no root view controller!")
            return
        }
        GIDSignIn.sharedInstance.signIn(with: configuration,
                                        presenting: rootViewController) { user, error in
            guard let googleUser = user, let user = UserModel(googleUser: googleUser) else {
                print("Error! \(String(describing: error))")
                return
            }
            self.state.wrappedValue = .signedIn(user)
        }
    }

    /// Signs out the current user.
    func signOut() {
        GIDSignIn.sharedInstance.signOut()
        state.wrappedValue = .signedOut
    }

    /// Adds the birthday read scope for the current user.
    /// - parameter completion: An escaping closure that is called upon successful completion of the
    /// `addScopes(_:presenting:)` request.
    /// - note: Successful requests will update the `authViewModel.state` with a new current user that
    /// has the granted scope.
    func addBirthdayReadScope(completion: @escaping () -> Void) {
        guard let rootViewController = UIApplication.shared.keyWindow?.rootViewController else {
            fatalError("No root view controller!")
        }

        GIDSignIn.sharedInstance.addScopes(scopes,
                                           presenting: rootViewController) { user, error in
            if let error = error {
                print("Found error while adding birthday read scope: \(error).")
                return
            }

            guard let googleUser = user, let currentUser = UserModel(googleUser: googleUser) else { return }
            self.state.wrappedValue = .signedIn(currentUser)
            completion()
        }
    }

    /// Disconnects the previously granted scope and signs the user out.
    func disconnect() {
        GIDSignIn.sharedInstance.disconnect { error in
            if let error = error {
                print("Encountered error disconnecting scope: \(error).")
            }
            self.signOut()
        }
    }

}
