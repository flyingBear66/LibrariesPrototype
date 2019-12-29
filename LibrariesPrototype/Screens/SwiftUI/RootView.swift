//
//  RootView.swift
//  SwiftUITemplates
//
//  Created by Ozgun Zor on 20/11/2019.
//  Copyright © 2019 Ozgun Zor. All rights reserved.
//

import SwiftUI
// swiftlint:disable file_types_order

var event1 = EventUI(name: "Event1",
                     start: Date(timeIntervalSince1970: 100),
                     end: Date(timeInterval: 50, since: Date()),
                     owner: "Ozgun Zor")

var event2 = EventUI(name: "Event2",
                     start: Date(timeInterval: 1000, since: Date()),
                     end: Date(timeInterval: 1500, since: Date()),
                     owner: "Emre Zor")

var event3 = EventUI(name: "Event3",
                     start: Date(timeInterval: 2000, since: Date()),
                     end: Date(timeInterval: 2500, since: Date()),
                     owner: "Ozge Zor")
var event4 = EventUI(name: "Event4",
                     start: Date(timeInterval: 3000, since: Date()),
                     end: Date(timeInterval: 3500, since: Date()),
                     owner: "Sedef Zor")

var events = [event1, event2, event3, event4]

struct RootView: View {
    @ObservedObject var room = Room(name: "Douro", events: events)

    var body: some View {
        HStack {
            Rectangle()
                .fill(self.room.statusColor)
                .frame(width: 30, alignment: .leading)
            RoomStatusView(room: self.room)
            Spacer()
        }
        .frame(alignment: .leading)
        .onAppear(perform: fetchEvents)
    }

    func fetchEvents() {
        guard let url = URL(string: "https://getaroom.xing.hh/api/rooms/_\(self.room.name)@xing.com/events") else {
            print("Invalid URL")
            return
        }

        let request = URLRequest(url: url)

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .formatted(DateFormatter.iso8601Full)
                if let decodedData = try? JSONDecoder().decode([EventModel].self, from: data) {
                    // we have good data – go back to the main thread

                    DispatchQueue.main.async {
                        // update our UI
                        self.room.events = mapEventModelToEvent(decodedData)
                    }

                    // everything is good, so we can exit
                    return
                }
            }

            // if we're still here it means there was a problem
            print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
        }.resume()
    }
}

func mapEventModelToEvent(_ eventModels: [EventModel]) -> [EventUI] {
    eventModels.map { model -> EventUI in
        EventUI(name: model.description, start: model.startDate, end: model.endDate, owner: model.description)
    }
}

struct BookingButton: View {
    var text: String
    @ObservedObject var room: Room
    var action: () -> Void

    var body: some View {
        Button(text, action: action)
            .frame(width: 150, height: 50, alignment: .center)
            .background(Color.purple)
            .foregroundColor(.white)
            .cornerRadius(5)
    }
}

struct OtherButtons: View {
    @ObservedObject var room: Room

    var eventName: String {
        (self.room.currentEvent == nil) ? "Nil" : self.room.currentEvent!.name
    }

    var eventOwner: String {
        (self.room.currentEvent == nil) ? "Nil" : self.room.currentEvent!.owner
    }

    var body: some View {
        VStack(alignment: .leading) {
            Text(eventName )
                .font(.headline)
                .fontWeight(.bold)
                .padding(.bottom, 5)
            Text(eventOwner)
                .font(.footnote)
                .padding(.bottom, 10)
            HStack {
                BookingButton(text: "End Now", room: self.room) {
                    self.room.endNow()
                }
                BookingButton(text: "Add Time", room: self.room) {
                    self.room.addTime()
                }
            }
        }
    }
}

struct TopStatusView: View {
    @ObservedObject var room: Room

    var recColor: Color {
        switch self.room.status {
        case .free:
            return .green
        case .occupied:
            return .red
        case .almost:
            return .yellow
        }
    }

    var currentEventEndDate: String {
        if self.room.status == .free {
            return ""
        }

        return self.room.currentEvent?.formattedEndDate ?? ""
    }

    var body: some View {
        VStack(alignment: .leading) {
            Text(room.name)
                .font(.headline)
                .fontWeight(.bold)
            Text(self.room.status == .free ? "Available" : "Occupied")
                .foregroundColor(self.recColor)
                .font(.largeTitle)
                .fontWeight(.heavy)
            Text(currentEventEndDate)
                .font(.footnote)
        }
    }
}

struct NextEventsView: View {
    @ObservedObject var room: Room
    @Binding var isEditEventShowed: Bool
    @State var selectedEvent = EventUI(name: "", start: Date(), end: Date(), owner: "")

    var body: some View {
        VStack(alignment: .leading) {
            Text("Next events:")
                .font(.largeTitle)
            ScrollView(.horizontal) {
                HStack {
                    ForEach(self.room.nextEvents ?? []) { element in
                        NextEventView(event: element)
                            .onTapGesture {
                                self.isEditEventShowed = true
                        }
                    }
                }
            }
        }
        .sheet(isPresented: $isEditEventShowed) {
            EditEventView(isEditEventShowed: self.$isEditEventShowed)
        }
    }
}

struct NextEventView: View {
    var event: EventUI

    var body: some View {
        VStack(alignment: .leading) {
            Text(event.name)
                .font(.headline)
            Text(event.formattedStartDate)
                .font(.body)
            Text(event.formattedEndDate)
                .font(.body)
            Text(event.owner)
                .font(.footnote)
        }
        .padding(10)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.black, lineWidth: 2))
    }
}

struct RoomStatusView: View {
    @ObservedObject var room: Room
    @State var isCreateEventShowed: Bool = false
    @State var isEditEventShowed: Bool = false

    var body: some View {
        VStack(alignment: .leading) {
            TopStatusView(room: room)
                .frame(alignment: .topLeading)
            Spacer()
            VStack(spacing: 10) {
                if self.room.status == .free {
                    BookingButton(text: "Book Now", room: self.room) {
                        self.room.bookNow()
                    }
                } else {
                    OtherButtons(room: self.room)
                }
                BookingButton(text: "Create Event", room: self.room) {
                    //
                    self.isCreateEventShowed = true
                }
            }
            Spacer()
            NextEventsView(room: room, isEditEventShowed: self.$isEditEventShowed)
        }
        .sheet(isPresented: $isCreateEventShowed) {
            CreateEventView(isCreateEventShowed: self.$isCreateEventShowed)
        }
    }
}

struct EditEventView: View {
    @Binding var isEditEventShowed: Bool
    @State var selectedStartDate = Date()
    @State var selectedEndDate = Date()

    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section {
                        DatePicker(
                            selection: $selectedStartDate,
                            displayedComponents: [.hourAndMinute, .date],
                            label: { Text("Start Time:") }
                        )
                    }

                    Section {
                        DatePicker(
                            selection: $selectedEndDate,
                            displayedComponents: [.hourAndMinute, .date],
                            label: { Text("End Time:") }
                        )
                    }

                    Section {
                        Text("Title:")
                        Text("Owner: Test Owner")
                    }
                }
            }
            .navigationBarItems(trailing:
                Button("Done") {
                    self.isEditEventShowed = false
                }
            )
        }
    }
}

struct CreateEventView: View {
    @Binding var isCreateEventShowed: Bool
    @State var title: String = ""
    @State var selectedStartDate = Date()
    @State var selectedEndDate = Date()

    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section {
                        TextField("Title", text: $title)
                    }

                    Section {
                        DatePicker(
                            selection: $selectedStartDate,
                            displayedComponents: [.hourAndMinute, .date],
                            label: { Text("Start Time:") }
                        )
                    }

                    Section {
                        DatePicker(
                            selection: $selectedEndDate,
                            displayedComponents: [.hourAndMinute, .date],
                            label: { Text("End Time:") }
                        )
                    }

                    Section {
                        Text("Title: \(title)")
                        Text("Owner: Test Owner")
                    }
                }
            }
            .navigationBarItems(trailing:
                Button("Done") {
                    self.isCreateEventShowed = false
                }
            )
        }
    }
}
// swiftlint:enable file_types_order
