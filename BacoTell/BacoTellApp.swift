//
//  BacoTellApp.swift
//  BacoTell
//
//  Created by Srinath Shah on 5/19/24.
//

import SwiftUI

@main
struct BacoTellApp: App {
    @State var user: User = User(name: "Sam")
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(user)
        }
    }
}
