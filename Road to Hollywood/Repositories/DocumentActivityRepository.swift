//
//  DocumentChangeLogRepository.swift
//  Road to Hollywood
//
//  Created by Miroslav Kutak on 22/11/21.
//

import Foundation

protocol DocumentActivityRepository {
    init()
    func getDocumentSummaryActivity(document: DocumentModel, completion: @escaping (_ result: Result<DocumentSummaryActivitiesResponse, Error>) -> Void)
}
