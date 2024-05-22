//
//  HeaderView.swift
//  BacoTell
//
//  Created by Srinath Shah on 5/21/24.
//

import SwiftUI

struct HeaderView: View {
    var name: String
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                
                Text("Hey, \(name)!")
                    .font(.title2)
                    .fontWeight(.bold)
                
                
                NavigationLink(destination: {Text("\(name)'s Inbox")}) {
                    Label("INBOX", systemImage: "mail")
                }
            }
            Spacer()
        }
        .padding(.top)
    }
}

#Preview {
    HeaderView(name: "Sam")
}
