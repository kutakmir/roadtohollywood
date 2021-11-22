//
//  DocumentChangeLogRepository.swift
//  Road to Hollywood
//
//  Created by Miroslav Kutak on 22/11/21.
//

import Foundation

protocol DocumentActivityRepository {
    init()
    func getDocumentActivity(document: DocumentModel, completion: @escaping (_ result: Result<DocumentActivitiesResponse, Error>) -> Void)
}
