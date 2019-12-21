//
//  ContentView.swift
//  SwiftUITemplates
//
//  Created by Ozgun Zor on 19/11/2019.
//  Copyright © 2019 Ozgun Zor. All rights reserved.
//

import SwiftUI

class User: ObservableObject {
    @Published var state: UserState = .loggedOut
}

struct LoginView: View {
    @ObservedObject var user: User

    var body: some View {
        Button("Login") {
            self.user.state = .loggedIn
        }
    }
}

struct HomeView: View {
    @ObservedObject var user: User

    var body: some View {
        Button("HomePage") {
            self.user.state = .loggedOut
        }
    }
}

enum UserState {
    case loggedIn
    case loggedOut
}

struct ContentView: View {
    @ObservedObject var user = User()

    var body: some View {
        RootView()
//        Group {
//            if user.state == .loggedIn {
//                HomeView(user: user)
//            } else {
//                LoginView(user: user)
//            }
//        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
