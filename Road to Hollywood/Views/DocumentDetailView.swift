//
//  DocumentDetailView.swift
//  Road to Hollywood
//
//  Created by Miroslav Kutak on 22/11/21.
//

import SwiftUI

struct DocumentDetailView: View {
    @EnvironmentObject var diContainer: DependencyInjectionContainer

    enum Segment: Int {
        case summary
        case activity
    }

    @State var selectedTab: Segment = .summary

    var body: some View {
        VStack {
            Picker("What is your favorite color?", selection: $selectedTab) {
                Text("Summary").tag(Segment.summary)
                Text("Detailed").tag(Segment.activity)
            }
            .pickerStyle(.segmented)

            switch selectedTab {
            case .summary:
                DocumentSummaryActivityView(viewModel: DocumentSummaryActivityViewModel(document: .mock, repository: diContainer.documentActivityRepository))
            case .activity:
                DocumentActivityView(viewModel: DocumentActivityViewModel(document: .mock, repository: diContainer.documentActivityRepository))
            }

            Spacer()
        }
    }
}

struct DocumentDetailView_Previews: PreviewProvider {
    static var previews: some View {
        DocumentDetailView()
    }
}
