//
//  Road_to_HollywoodApp.swift
//  Road to Hollywood
//
//  Created by Miroslav Kutak on 19/11/21.
//

import SwiftUI
import GoogleSignIn

@main
struct RoadToHollywoodApp: App {
    @StateObject var diContainer = DependencyInjectionContainer(authControllerType: GoogleAuthenticationController.self, documentChangeLogRepositoryType: MockDocumentActivityRepository.self)

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(diContainer)
        }
    }
}
