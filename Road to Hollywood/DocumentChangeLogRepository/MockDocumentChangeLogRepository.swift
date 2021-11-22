//
//  MockDocumentChangeLogRepository.swift
//  Road to Hollywood
//
//  Created by Miroslav Kutak on 22/11/21.
//

import Foundation

class MockDocumentChangeLogRepository: DocumentChangeLogRepository {
    var responseShouldSucceed: Bool = true

    func getDocumentSummaryRevisions(document: DocumentModel, completion: @escaping (Result<DocumentSummaryActivitiesResponse, Error>) -> Void) {
        performInAWhile {
            if self.responseShouldSucceed {
                completion(.success(.mock))
            } else {
                completion(.failure(MockDocumentActivitiesError.mock))
            }
        }
    }

    func getDocumentRevisions(document: DocumentModel, completion: @escaping (Result<DocumentActivitiesResponse, Error>) -> Void) {
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
