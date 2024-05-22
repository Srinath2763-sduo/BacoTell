//
//  OfferView.swift
//  BacoTell
//
//  Created by Srinath Shah on 5/21/24.
//

import SwiftUI

struct OfferView: View {
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            Image("Tacos")
                .resizable()
                .frame(maxWidth: .infinity, maxHeight: 250)
                .background(LinearGradient(colors: [.black, .clear], startPoint: .leading, endPoint: .trailing))
            Rectangle()
                   .foregroundColor(.clear)
                   .background(LinearGradient(gradient: Gradient(colors: [.black.opacity(0.8), .clear]), startPoint: .leading, endPoint: .init(x: 1, y: 0.5)))
            HStack {
                VStack(alignment: .leading) {
                    Text("Deluxe Cravings")
                        .font(.title)
                        .fontWeight(.bold)
                    Text("Get the most out of your cravings nachos in deluxe craving box Cravings")
                    Button(action: {}, label: {Text("Order Now")})
                        .buttonStyle(.borderedProminent)
                }
                Spacer()
            }
            .foregroundColor(.white)
            .padding(.bottom)
        }
      
    }
}

#Preview {
    OfferView()
}
