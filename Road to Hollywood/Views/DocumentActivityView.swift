//
//  DocumentActivityView.swift
//  Road to Hollywood
//
//  Created by Miroslav Kutak on 20/11/21.
//

import SwiftUI

struct DocumentActivityView: View {
    @EnvironmentObject var diContainer: DependencyInjectionContainer

    @StateObject var viewModel: DocumentActivityViewModel

    var body: some View {
        VStack {
            switch viewModel.resource {
            case .loading:
                ProgressView()
            case .success(let response):
                ScrollView {
                    VStack(spacing: 20) {
                        ForEach(response.activities) { activity in
                            Text(activity.description)
                        }
                    }
                }
            case .error(let error):
                Text(error.localizedDescription)
            }
        }
    }

}
