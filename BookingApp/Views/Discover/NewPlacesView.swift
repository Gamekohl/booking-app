//
//  NewPlacesView.swift
//  BookingApp
//
//  Created by Julian on 19.12.23.
//

import SwiftUI

struct NewPlacesView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Discover new places")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundStyle(.mainText)
                .padding(.horizontal, 24)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    Place(image: "https://source.unsplash.com/random/?norway,landscape", title: "Norway")
                    Place(image: "https://source.unsplash.com/random/?sweden,landscape", title: "Sweden")
                    Place(image: "https://source.unsplash.com/random/?finland,landscape", title: "Finland")
                    Place(image: "https://source.unsplash.com/random/?germany,city", title: "Germany")
                }
                .padding(.vertical, 16)
                .padding(.horizontal, 24)
            }
            .padding(.vertical, -8)
        }
    }
    
    @ViewBuilder
    func Place(image: String, title: String) -> some View {
        AsyncImage(url: URL(string: image)) { image in
            image
                .frame(width: 320, height: 200)
                .aspectRatio(contentMode: .fit)
                .overlay {
                    ZStack(alignment: .leading) {
                        LinearGradient(colors: [.clear, .black.opacity(0.8)], startPoint: .top, endPoint: .bottom)
                        
                        VStack {
                            Spacer()
                            Text(title)
                                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                    .fontWeight(.semibold)
                                    .foregroundStyle(.white)
                                    .padding(.horizontal, 16)
                                    .padding(.bottom, 16)
                            }
                        }
                }
                .clipShape(RoundedRectangle(cornerRadius: 15))
        } placeholder: {
            
        }
        .shadow(radius: 10)
    }
}

#Preview {
    NewPlacesView()
}
