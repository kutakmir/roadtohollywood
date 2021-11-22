//
//  DependencyInjection.swift
//  Road to Hollywood
//
//  Created by Miroslav Kutak on 22/11/21.
//

import SwiftUI

struct SignInView: View {
    @EnvironmentObject var diContainer: DependencyInjectionContainer

    var body: some View {
        if let _ = diContainer.authController as? GoogleAuthenticationController {
            GoogleSignInView()
        } else {
            MockSignInView()
        }
    }
}


struct MockSignInView: View {
    @EnvironmentObject var diContainer: DependencyInjectionContainer

    var body: some View {
        VStack {
            switch diContainer.state {
            case .signedOut:
                Button(action: diContainer.authController.signIn) {
                    Text("Sign In")
                }
            case .signedIn:
                Button(action: diContainer.authController.signIn) {
                    Text("Sign Out")
                }
            }
        }
    }
}

struct GoogleSignInView: View {
    @EnvironmentObject var diContainer: DependencyInjectionContainer

    var body: some View {
        VStack {
            GoogleSignInButtonWrapper(handler: diContainer.authController.signIn)
                .accessibility(hint: Text("Sign in with Google button."))
        }
    }
}
