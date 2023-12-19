//
//  Place.swift
//  BookingApp
//
//  Created by Julian on 19.12.23.
//

import SwiftUI
import SkeletonUI

struct PlaceView: View {
    @State var place: Place
    @State private var expandPlace = false
    
    var body: some View {
        ZStack(alignment: .top) {
            Rectangle()
                .fill(.white)
                .frame(maxWidth: 320)
                .clipShape(RoundedRectangle(cornerRadius: 30))
                .shadow(radius: 10)
            
            VStack(alignment: .leading) {
                AsyncImage(url: URL(string: place.image)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 320, height: 200)
                        .clipShape(RoundedRectangle(cornerRadius: 30))
                        .overlay(alignment: .topTrailing) {
                            Image(systemName: "heart")
                                .frame(width: 32, height: 32)
                                .background(.white)
                                .clipShape(Circle())
                                .offset(x: -16, y: 16)
                            
                        }
                } placeholder: {
                    Rectangle()
                        .fill(.white)
                        .frame(width: 320, height: 200)
                        .clipShape(RoundedRectangle(cornerRadius: 30))
                        .skeleton(
                            with: true,
                            size: CGSize(width: 320, height: 200), animation: .pulse(), shape: .rounded(.radius(30)))
                }
                .onTapGesture {
                    expandPlace.toggle()
                }
                
                VStack(alignment: .leading) {
                    Text(place.title)
                        .font(.subheadline)
                        .bold()
                    
                    Spacer()
                        .frame(height: 8)
                    
                    Text(place.amenities)
                        .font(.caption)
                        .foregroundStyle(.gray.opacity(0.4))
                    
                    Spacer()
                        .frame(height: 8)
                    
                    HStack {
                        if place.hasDiscount {
                            Text("€\(NSNumber(value: round(place.pricePerNight * 1.2)).intValue)")
                                .font(.subheadline)
                                .strikethrough()
                                .foregroundStyle(.gray.opacity(0.7))
                        }
                        Text("€\(NSNumber(value: place.pricePerNight).intValue) night")
                            .font(.subheadline)
                            .bold()
                    }
                }
                .padding(.horizontal, 16)
                .padding(.bottom, 16)
                .padding(.top, 8)
                .fullScreenCover(isPresented: $expandPlace) {
                    DetailPlaceView(place: place)
                }
            }
        }
        .frame(maxWidth: 320)
    }
}

#Preview {
    PlaceView(place: Place(image: "https://plus.unsplash.com/premium_photo-1680100256112-2e1231d9d0df?q=80&w=2787&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", title: "Test", amenities: "1 guest • 1 bedroom • 1 bed • 1 bathroom", pricePerNight: 100, hasDiscount: true))
}
