//
//  MockDocumentChangeLogRepository.swift
//  Road to Hollywood
//
//  Created by Miroslav Kutak on 22/11/21.
//

import Foundation

class MockDocumentActivityRepository: DocumentActivityRepository {

    // For unit testing purposes
    var responseShouldSucceed: Bool = true

    required init() {}

    func getDocumentActivity(document: DocumentModel, completion: @escaping (Result<DocumentActivitiesResponse, Error>) -> Void) {
        performInAWhile {
            if self.responseShouldSucceed {
                completion(.success(.mock))
            } else {
                completion(.failure(MockDocumentActivitiesError.mock))
            }
        }
    }

    private func performInAWhile(_ completion: @escaping () -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: completion)
    }

}
