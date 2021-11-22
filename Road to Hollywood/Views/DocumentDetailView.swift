//
//  DocumentDetailView.swift
//  Road to Hollywood
//
//  Created by Miroslav Kutak on 22/11/21.
//

import SwiftUI

struct DocumentDetailView: View {
    @EnvironmentObject var diContainer: DependencyInjectionContainer

    var body: some View {
        VStack {
            DocumentActivityView(viewModel: DocumentActivityViewModel(document: .mock, repository: diContainer.documentActivityRepository))
        }
    }
}

struct DocumentDetailView_Previews: PreviewProvider {
    static var previews: some View {
        DocumentDetailView()
    }
}
