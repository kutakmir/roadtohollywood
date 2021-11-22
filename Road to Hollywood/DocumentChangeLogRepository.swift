//
//  DocumentChangeLogRepository.swift
//  Road to Hollywood
//
//  Created by Miroslav Kutak on 22/11/21.
//

import Combine

struct Document {
    let id: String
    let url: URL
    let name: String
}

protocol DocumentChangeLogRepository {
    func getDocumentSummaryRevisions(document: Document, completion: @escaping (_ result: Result<DocumentSummaryActivitiesResponse, Error>) -> Void)
    func getDocumentRevisions(document: Document, completion: @escaping (_ result: Result<DocumentActivitiesResponse, Error>) -> Void)
}

class MockDocumentChangeLogRepository: DocumentChangeLogRepository {
    var responseShouldSucceed: Bool = true

    func getDocumentSummaryRevisions(document: Document, completion: @escaping (Result<DocumentSummaryActivitiesResponse, Error>) -> Void) {
        performInAWhile {
            if self.responseShouldSucceed {
                completion(.success(.mock))
            } else {
                completion(.failure(MockDocumentActivitiesError.mock))
            }
        }
    }

    func getDocumentRevisions(document: Document, completion: @escaping (Result<DocumentActivitiesResponse, Error>) -> Void) {
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


class GoogleDriveDocumentChangeLogRepository: DocumentChangeLogRepository {
    func getDocumentSummaryRevisions(document: Document, completion: @escaping (Result<DocumentSummaryActivitiesResponse, Error>) -> Void) {
        // FIXME: missing implementation
    }

    func getDocumentRevisions(document: Document, completion: @escaping (Result<DocumentActivitiesResponse, Error>) -> Void) {
        // FIXME: missing implementation
    }


}
