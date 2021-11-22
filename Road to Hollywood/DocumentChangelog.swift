//
//  DocumentChangelog.swift
//  Road to Hollywood
//
//  Created by Miroslav Kutak on 20/11/21.
//

import SwiftUI
import GoogleAPIClientForRESTCore

struct DocumentChangeLog: View {

    var body: some View {
        Text("Hey")
            .onAppear(perform: onAppear)
    }

    private func onAppear() {
//        let asdf2 = GTLRDriveActivity_QueryDriveActivityRequest()
//        let asdf = GTLRDriveActivityQuery_ActivityQuery(object: asdf2)

//        let query = GTLRDriveActivityQuery_ActivityQuery.query()
//        query.q = "name = '\(filename)'"
//        query.pageToken = pageToken
//        query.spaces = Self.folder
//        query.fields = "files(id)"
//        let response: GTLRDrive_FileList = try await service.execute(query)
    }

}

extension GTLRService {
    enum ErrorType: Error {
        case notAuthorized
        case unableToConvertResponse
    }
}

extension GTLRService {

    public func execute<Query: GTLRQueryProtocol>(_ query: Query) {
        executeQuery(query)
    }

    public func execute<Query: GTLRQueryProtocol, Response>(_ query: Query) async throws -> Response {
        return try await withCheckedThrowingContinuation { continuation in
            executeQuery(query) { _, response, error in
                if let solidError = error {
                    continuation.resume(throwing: solidError)
                    return
                }
                guard let typedResponse = response as? Response else {
                    continuation.resume(throwing: ErrorType.unableToConvertResponse)
                    return
                }
                continuation.resume(returning: typedResponse)
            }
        }
    }
}
