//
//  HomeView.swift
//  BacoTell
//
//  Created by Srinath Shah on 5/21/24.
//

import SwiftUI

struct HomeView: View {
    @State private var delivermethod: DeliveryMethod = .pickup
    @Environment(User.self) var user
    var body: some View {
        
        NavigationStack {
            VStack {
                    HStack {
                        Picker("Delivery Method", selection: $delivermethod) {
                            Text("Pickup")
                                .tag(DeliveryMethod.pickup)
                            Text("Delivery")
                                .tag(DeliveryMethod.delivery)
                        }
                        .pickerStyle(.palette)
                        .overlay{Capsule().stroke(Color.purple, lineWidth: 1.0) }
                        
                        VStack(alignment: .leading) {
                            Text("Location")
                                .font(.footnote)
                            Text("1101 N Ciollings Arlington, TX, 76011")
                                .foregroundColor(Color.blue)
                                .underline()
                                .onTapGesture {
                                    UIApplication.shared.open(.init(string: "bacotell://maps?lat=32.75208029068733&long=-97.09679789058693")!)
                                }
                        }
                    }
                   
                        ScrollView {
                            HeaderView(name: user.name)
                            OfferView()
                            MenuOfferView()
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .padding()
                                .shadow(radius: 10,y: 10)
                           
                        }
                        .overlay(alignment: .bottom, content: {
                            Button(action: {}, label: {
                                Spacer()
                                Text("Start Order")
                                    .padding()
                                Spacer()
                            })
                            .background(Rectangle().fill(Color.purple))
                            .foregroundColor(.white)
                        })
                   
            }
        }
         
    }
}

#Preview {
    HomeView()
}
