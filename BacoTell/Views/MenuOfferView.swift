//
//  MenuOfferView.swift
//  BacoTell
//
//  Created by Srinath Shah on 5/21/24.
//

import SwiftUI

struct MenuOfferView: View {
    var body: some View {
        VStack(alignment:.leading) {
            Image("Fries")
                .resizable()
                .frame(maxHeight: 400)
                .scaledToFill()
            Text("Complete Your Cravings With Fries")
                .fontWeight(.bold)
                
            Text("Trust us on the one. Fries are perfect to your order.")
                .font(.footnote)
                .padding(4)
            HStack(alignment: .center,spacing: 40) {
                Spacer()
                Button(action: {}, label: {Text("Get Large").padding(4)})
                    .background(
                        Rectangle()
                            .stroke(.purple, lineWidth: 2)
                    )
                    .foregroundColor(.purple)
                
                Button(action: {}, label: {Text("Get Regular")})
                    .buttonStyle(.bordered)
                Spacer()
            }
            .padding(.bottom)
        }
        .background(Color.white)
        
    }
}

#Preview {
    MenuOfferView()
}
