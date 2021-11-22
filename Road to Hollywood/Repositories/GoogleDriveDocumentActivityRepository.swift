//
//  GoogleDriveDocumentChangeLogRepository.swift
//  Road to Hollywood
//
//  Created by Miroslav Kutak on 22/11/21.
//

import Foundation

class GoogleDriveDocumentActivityRepository: DocumentActivityRepository {
    required init() {}

    func getDocumentSummaryActivity(document: DocumentModel, completion: @escaping (Result<DocumentSummaryActivitiesResponse, Error>) -> Void) {
        // FIXME: missing implementation
    }
}
