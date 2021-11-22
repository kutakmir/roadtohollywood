//
//  DocumentActivityViewModel.swift
//  Road to Hollywood
//
//  Created by Miroslav Kutak on 22/11/21.
//

import SwiftUI

class DocumentActivityViewModel: ObservableObject {
    private let document: DocumentModel
    @Published var resource: Resource<DocumentActivitiesResponse> = .loading

    let repository: DocumentActivityRepository
    init(document: DocumentModel, repository: DocumentActivityRepository) {
        self.repository = repository
        self.document = document
        refreshActivities()
    }

    func refreshActivities() {
        repository.getDocumentActivity(document: document) { [weak self] result in
            self?.resource = .resource(from: result)
        }
    }
}
