//
//  GoogleDriveDocumentChangeLogRepository.swift
//  Road to Hollywood
//
//  Created by Miroslav Kutak on 22/11/21.
//

import Foundation

class GoogleDriveDocumentActivityRepository: DocumentActivityRepository {
    required init() {}
    
    func getDocumentActivity(document: DocumentModel, completion: @escaping (Result<DocumentActivitiesResponse, Error>) -> Void) {
        // FIXME: missing implementation
    }
}
