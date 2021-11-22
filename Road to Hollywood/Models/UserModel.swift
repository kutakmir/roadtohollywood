//
//  UserModel.swift
//  Road to Hollywood
//
//  Created by Miroslav Kutak on 22/11/21.
//

import GoogleSignIn

struct UserModel {
    let id: String
    let email: String?
    let name: String?
}

extension UserModel {
    init?(googleUser: GIDGoogleUser) {
        guard let id = googleUser.userID else { return nil }
        self.id = id
        self.email = googleUser.profile?.email
        self.name = googleUser.profile?.name
    }
}

extension UserModel {
    static let mockTester1 = UserModel(id: "0", email: "mock@hollywood.com", name: "Mock Tester")
}
