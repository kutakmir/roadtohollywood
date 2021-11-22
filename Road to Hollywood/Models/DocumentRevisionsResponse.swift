//
//  DocumentRevisionsResponse.swift
//  Road to Hollywood
//
//  Created by Miroslav Kutak on 22/11/21.
//

import Foundation

/*
 ------------------------------------------------
 This is what we need to display
 ------------------------------------------------
 */

// MARK: - DocumentActivityResponse
struct DocumentSummaryActivitiesResponse: Codable {
    let activities: [DocumentSummaryActivity]
}

struct DocumentActivitiesResponse: Codable {
    let activities: [DocumentActivity]
}

// MARK: - Activity
struct DocumentSummaryActivity: Codable, Identifiable {
    let id: String
    let actor: Actor
    let timestamp: Timestamp
}

extension DocumentSummaryActivity: CustomStringConvertible {
    var description: String {
        "Id: \(id), CreatedBy: \(self.actor), CreationTime: \(timestamp)"
    }
}

// No need for multiple actors here as we want to group the actions by actor
// We also don't have to specify the target as it's contextual to the request which is always pointing to a single target
// We also don't need the primary action detail
struct DocumentActivity: Codable, Identifiable {
    let id: String
    let actor: Actor
    let timestamp: Timestamp
    let action: ActionDescription
}

extension DocumentActivity: CustomStringConvertible {
    var description: String {
    """
        Id: \(id), CreatedBy: \(self.actor.email ?? ""), CreationTime: \(timestamp)
        Player: \(self.actor.name ?? "")      Changes: \(action.description)
    """
    }
}

// There is a complex structure of the G-Drive changes response
// That's understandible, but for our purposes, the decoupled interface doesn't need to redefine the whole structure
// Reference: https://developers.google.com/drive/activity/v2/reference/rest/v2/activity/actiondetail#ActionDetail
// So all we need for the time being is the type of the action and textual description of the change that took place
struct ActionDescription: Codable {
    let actionType: DocumentChangeActionType
    let description: String
}

enum DocumentChangeActionType: String, Codable {
    case create, edit, move, rename, delete, restore, permissionChange, comment, dlpChange, reference, settingsChange
}

// MARK: - Actor
// Unlike G-Drive, we can use a flat struct here
struct Actor: Codable, Identifiable {
    let id: String
    let name: String?
    let email: String?
}

extension Actor: CustomStringConvertible {
    var description: String {
        name ?? email ?? id
    }
}

// MARK: - Timestamp
// Generating description in init is less CPU intensive than whenever we want to display
struct Timestamp: Codable, CustomStringConvertible {
    let seconds: Int
    let nanos: Int
    let date: Date
    let description: String

    init(seconds: Int, nanos: Int) {
        let timeInterval = TimeInterval(seconds + nanos / 1000)
        self.seconds = seconds
        self.nanos = nanos
        date = Date(timeIntervalSince1970: timeInterval)
        description = Timestamp.defaultDateFormatter.string(from: date)
    }

    init(timeInterval: TimeInterval) {
        let seconds = Int(timeInterval)
        let nanos = Int(timeInterval * 1000  - TimeInterval(seconds))
        self.init(seconds: seconds, nanos: nanos)
    }

    init?(description: String) {
        guard let date = Timestamp.defaultDateFormatter.date(from: description) else {
            return nil
        }
        self.init(timeInterval: date.timeIntervalSince1970)
    }
}

// Defining and initializing the DateFormatter only once also saves resources
// If we needed to customize the date formatting, we can of course write custom code
// This is the default implementation
extension Timestamp {
    static let defaultDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "m/d/y h:mm:ss a"
        return formatter
    }()
}
