//
//  DocumentChangeLogRepository.swift
//  Road to Hollywood
//
//  Created by Miroslav Kutak on 22/11/21.
//

import Foundation

protocol DocumentChangeLogRepository {
    func getDocumentSummaryRevisions(document: DocumentModel, completion: @escaping (_ result: Result<DocumentSummaryActivitiesResponse, Error>) -> Void)
    func getDocumentRevisions(document: DocumentModel, completion: @escaping (_ result: Result<DocumentActivitiesResponse, Error>) -> Void)
}
