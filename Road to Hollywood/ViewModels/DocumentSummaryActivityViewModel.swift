//
//  DocumentSummaryActivityViewModel.swift
//  Road to Hollywood
//
//  Created by Miroslav Kutak on 22/11/21.
//

import SwiftUI

class DocumentSummaryActivityViewModel: ObservableObject {
    private let document: DocumentModel
    @Published var resource: Resource<DocumentSummaryActivitiesResponse> = .loading

    let repository: DocumentActivityRepository
    init(document: DocumentModel, repository: DocumentActivityRepository) {
        self.repository = repository
        self.document = document
        refreshActivities()
    }

    func refreshActivities() {
        repository.getDocumentSummaryActivity(document: document) { [weak self] result in
            self?.resource = .resource(from: result)
        }
    }
}
