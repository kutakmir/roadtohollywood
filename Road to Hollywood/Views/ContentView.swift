//
//  ContentView.swift
//  Road to Hollywood
//
//  Created by Miroslav Kutak on 19/11/21.
//

import SwiftUI
import GoogleSignIn

struct ContentView: View {
    @EnvironmentObject var diContainer: DependencyInjectionContainer

    var body: some View {
        return Group {
            NavigationView {
                switch diContainer.state {
                case .signedIn:
                    DocumentDetailView()
                        .navigationTitle("Document Activity")
                case .signedOut:
                    SignInView()
                        .navigationTitle("Sign-in with Google")
                }
            }
            .navigationViewStyle(StackNavigationViewStyle())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
