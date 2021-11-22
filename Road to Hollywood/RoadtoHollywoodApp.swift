//
//  Road_to_HollywoodApp.swift
//  Road to Hollywood
//
//  Created by Miroslav Kutak on 19/11/21.
//

import SwiftUI
import GoogleSignIn

@main
struct RoadtoHollywoodApp: App {
    @StateObject var diContainer = DependencyInjectionContainer(authControllerType: MockAuthenticationController.self, documentChangeLogRepositoryType: MockDocumentActivityRepository.self)

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(diContainer)
        }
    }
}
