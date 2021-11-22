//
//  DocumentRevisionsResponse+Mock.swift
//  Road to Hollywood
//
//  Created by Miroslav Kutak on 22/11/21.
//

import Foundation

extension DocumentActivitiesResponse {
    static let mock = DocumentActivitiesResponse(activities: [
        // It's safe to force unwrap here as we use predefined and tested input
        DocumentActivity(id: "2", actor: .jorgeDelafuente, timestamp: Timestamp(description: "10/7/2021 11:00:52 PM")!, action: ActionDescription(actionType: .edit, description: """
        Changes: TotalMiles[57.96,66.96]
                 10/8[null,9]
        """)),
        DocumentActivity(id: "3", actor: .jorgeDelafuente, timestamp: Timestamp(description: "10/11/2021 8:57:06 PM")!, action: ActionDescription(actionType: .edit, description: """
        Changes: TotalMiles[59.38,69.38]
                 10/8[null,10]
        """))
    ])
}

extension DocumentSummaryActivitiesResponse {
    static let mock = DocumentSummaryActivitiesResponse(activities: [
        // It's safe to force unwrap here as we use predefined and tested input
        DocumentSummaryActivity(id: "1", actor: .jorgeDelafuente, timestamp: Timestamp(description: "10/7/2021 2:15:56 PM")!),
        DocumentSummaryActivity(id: "2", actor: .jorgeDelafuente, timestamp: Timestamp(description: "10/7/2021 11:00:52 PM")!),
        DocumentSummaryActivity(id: "3", actor: .jorgeDelafuente, timestamp: Timestamp(description: "10/11/2021 8:57:06 PM")!),
        DocumentSummaryActivity(id: "4", actor: .jorgeDelafuente, timestamp: Timestamp(description: "10/11/2021 9:38:34 PM")!)
    ])
}

extension Actor {
    static let jorgeDelafuente = Actor(id: "1", personName: "Jorge Delafuente", email: "jorge.delafuente@hollywood.com")
}

enum MockDocumentActivitiesError: Error {
    case mock
}
