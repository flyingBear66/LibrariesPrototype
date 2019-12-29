//
//  Models.swift
//  SwiftUITemplates
//
//  Created by Ozgun Zor on 20/11/2019.
//  Copyright © 2019 Ozgun Zor. All rights reserved.
//

import SwiftUI

class Room: ObservableObject {
    var name: String
    @Published var events: [EventUI]

    var status: RoomStatus {
        guard let currentEvent = currentEvent else {
            return .free
        }

        // Checks if the end date is less than 10 minutes
        if currentEvent.end < Date().addingTimeInterval(600) {
            return .almost
        }

        return .occupied
    }

    var statusColor: Color {
        switch self.status {
        case .free:
            return .green
        case .occupied:
            return .red
        case .almost:
            return .yellow
        }
    }

    var currentEvent: EventUI? {
        events.first { Date().isBetween($0.start, and: $0.end) }
    }

    var nextEvents: [EventUI]? {
        events.filter { $0.start > Date() }
    }

    init(name: String = "RoomTest", events: [EventUI] = [EventUI]()) {
        self.name = name
        self.events = events
    }

    func addEvent(_ event: EventUI) {
        events.append(event)
        events.sort { $0.start < $1.start }
    }

    func endNow() {
        guard let currentEvent = currentEvent else { return }
        let newEvent = EventUI(name: currentEvent.name, start: currentEvent.start, end: Date(), owner: currentEvent.owner)
        events[0] = newEvent
    }

    func bookNow() {
        let newEvent = EventUI(name: "BookedNow", start: Date(), end:  Date().addingTimeInterval(100), owner: "BookedNow")
        events.insert(newEvent, at: 0)
    }

    func addTime() {
        guard let currentEvent = currentEvent else { return }
        let newEvent = EventUI(name: currentEvent.name, start: currentEvent.start, end: currentEvent.end.addingTimeInterval(100), owner: currentEvent.owner)
        events[0] = newEvent
    }

}

enum RoomStatus {
    case free
    case almost
    case occupied
}

struct EventUI: Identifiable {

    var id = UUID()
    var name: String
    var start: Date
    @State var end: Date
    var owner: String

    var formattedEndDate: String {
        let formatter = DateFormatter()
        formatter.setLocalizedDateFormatFromTemplate("HH:mm")
        return "Until \(formatter.string(from: end))"
    }

    var formattedStartDate: String {
        let formatter = DateFormatter()
        formatter.setLocalizedDateFormatFromTemplate("HH:mm")
        return "Starting time: \(formatter.string(from: start))"
    }

    enum CodingKeys: String, CodingKey {
        case name = "description"
        case start = "start_date"
        case end = "end_date"
    }

//    init(name: String, start: Date, end: Date, owner: String) {
//        self.name = name
//        self.start = start
//        self.end = end
//        self.owner = owner
//    }
//
//    init(from decoder:Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        self.start = try values.decode(Date.self, forKey: .start)
//        self.end = try values.decode(Date.self, forKey: .end)
//        self.name = try values.decode(String.self, forKey: .name)
//        self.owner = try values.decode(String.self, forKey: .name)
//    }
//
//    public func encode(to encoder: Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//        try container.encode(start, forKey: .start)
//        try container.encode(end, forKey: .end)
//    }
}

extension DateFormatter {
  static let iso8601Full: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ"
    formatter.calendar = Calendar(identifier: .iso8601)
    formatter.timeZone = TimeZone(secondsFromGMT: 0)
    formatter.locale = Locale(identifier: "en_US_POSIX")
    return formatter
  }()
}

struct EventModel {
    var startDate: Date
    var endDate: Date
    var description: String
    var location: String

    private enum CodingKeys: String, CodingKey {
      case startDate = "start_date"
      case endDate = "end_date"
      case description
      case location
    }
}

extension EventModel: Decodable {
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    description = try container.decode(String.self, forKey: .description)
    location = try container.decode(String.self, forKey: .location)

    let formatter = DateFormatter.yyyyMMdd

    let startDateSting = try container.decode(String.self, forKey: .startDate)
    if let date = formatter.date(from: startDateSting) {
        startDate = date
    } else {
        throw DecodingError.dataCorruptedError(forKey: .startDate,
              in: container,
              debugDescription: "Date string does not match format expected by formatter.")
    }

    let endDateSting = try container.decode(String.self, forKey: .endDate)
    if let date = formatter.date(from: endDateSting) {
        endDate = date
    } else {
        throw DecodingError.dataCorruptedError(forKey: .endDate,
              in: container,
              debugDescription: "Date string does not match format expected by formatter.")
    }
  }
}

extension DateFormatter {
  static let yyyyMMdd: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd"
    formatter.calendar = Calendar(identifier: .iso8601)
    formatter.timeZone = TimeZone(secondsFromGMT: 0)
    formatter.locale = Locale(identifier: "en_US_POSIX")
    return formatter
  }()
}

extension Date {
    func isBetween(_ date1: Date, and date2: Date) -> Bool {
        return (min(date1, date2) ... max(date1, date2)).contains(self)
    }
}
