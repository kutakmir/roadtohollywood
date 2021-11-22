//
//  DocumentChangelogView.swift
//  Road to Hollywood
//
//  Created by Miroslav Kutak on 20/11/21.
//

import SwiftUI

enum Resource<T> {
    case loading
    case success(T)
    case error(Error)
}

class DocumentChangeLogViewModel: ObservableObject {
    private let document: DocumentModel
    @Published var resource: Resource<DocumentSummaryActivitiesResponse> = .loading

    let repository: DocumentChangeLogRepository
    init(document: DocumentModel, repository: DocumentChangeLogRepository) {
        self.repository = repository
        self.document = document
        refreshActivities()
    }

    func refreshActivities() {
        repository.getDocumentSummaryRevisions(document: document) { [weak self] result in
            self?.resource = .resource(from: result)
        }
    }
}

struct DocumentChangeLogView: View {
    @EnvironmentObject var diContainer: DependencyInjectionContainer

    @StateObject var viewModel: DocumentChangeLogViewModel

    var body: some View {
        VStack {
            switch viewModel.resource {
            case .loading:
                ProgressView()
            case .success(let response):
                ScrollView {
                    ForEach(response.activities) { activity in
                        Text(activity.description)
                    }
                }
            case .error(let error):
                Text(error.localizedDescription)
            }
        }
    }

}

extension Resource {

    static func resource<T>(from result: Result<T, Error>) -> Resource<T> {
        switch result {
        case .success(let item):
            return .success(item)
        case .failure(let error):
            return .error(error)
        }
    }
}
