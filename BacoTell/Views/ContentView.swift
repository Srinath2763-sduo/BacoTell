//
//  ContentView.swift
//  BacoTell
//
//  Created by Srinath Shah on 5/19/24.
//

import SwiftUI
import MapKit
struct ContentView: View {
    @State private var tab: Int = 1
    @Environment(User.self) var user
    @State var location: CLLocationCoordinate2D?
    
     var body: some View {
    

         TabView(selection: $tab){
            HomeView()
            .tabItem { Label(title: {Text("Home")}, icon: {Image(systemName: "bell")}) }
            .tag(1)
        
            VStack {
                NavigationStack {
                    MapViewSwiftUIView(location: $location)
                }
                  
            }
            .tag(2)
            .tabItem {  Label(title: {Text("Menu")}, icon: {Image(systemName: "carrot")})  }
            
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Hello, world!")
            }.tabItem {  Label(title: {Text("Rewards")}, icon: {Image(systemName: "flame")})  }
            
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Hello, world!")
            }.tabItem { Label(title: {Text("Menu")}, icon: {Image(systemName: "person.crop.circle")}) }
            
            
        }
        .onOpenURL(perform: { url in
            handleUrl(url: url)
        })
         
    }
    
    func handleUrl(url: URL) {
        guard url.scheme == "bacotell",
              let components = URLComponents(url: url, resolvingAgainstBaseURL: true),
              "maps" == url.host,
              let lat = components.queryItems?.first(where: {$0.name == "lat"})?.value as? String,
              let long = components.queryItems?.first(where: {$0.name == "long"})?.value as? String
        else {
            print("Error url: \(url)")
            return
        }
        withAnimation {
            tab = 2
            self.location = CLLocationCoordinate2D(latitude: Double(lat)!, longitude: Double(long)!)
        }        
    }
    
}

#Preview {
    ContentView()
        .environment(User(name: "Sam"))
}





