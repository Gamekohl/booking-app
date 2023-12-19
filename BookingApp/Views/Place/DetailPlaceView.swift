//
//  DetailPlaceView.swift
//  BookingApp
//
//  Created by Julian on 19.12.23.
//

import SwiftUI

struct DetailPlaceView: View {
    @Environment(\.dismiss) var dismiss
    
    @State var place: Place
    
    @State private var amenities: [AmenityModel] = [
        AmenityModel(title: "Wi-Fi", image: "wifi"),
        AmenityModel(title: "65\" HDTV", image: "tv"),
        AmenityModel(title: "Indoor fireplace", image: "fireplace"),
        AmenityModel(title: "Hair dryer", image: "fan"),
        AmenityModel(title: "Washing machine", image: "washer"),
        AmenityModel(title: "Dryer", image: "dryer"),
        AmenityModel(title: "Refrigerator", image: "refrigerator"),
        AmenityModel(title: "Dishwasher", image: "dishwasher"),
    ]
    @State private var offset: CGFloat = .zero
    
    var body: some View {
        NavigationStack {
            VStack {
                ZStack(alignment: .bottom) {
                    ScrollView {
                        AsyncImage(url: URL(string: "https://plus.unsplash.com/premium_photo-1680100256112-2e1231d9d0df?q=80&w=2787&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: UIScreen.main.bounds.width, height: 300)
                                .clipShape(.rect(bottomLeadingRadius: 50, bottomTrailingRadius: 50))
                        } placeholder: {
                            Rectangle()
                                .frame(height: 300)
                                .skeleton(with: true, size: CGSize(width: UIScreen.main.bounds.size.width, height: 300), animation: .pulse(),
                                          shape: .rounded(.radius(50, style: .circular)))
                                .clipShape(.rect(bottomLeadingRadius: 50, bottomTrailingRadius: 50))
                                .ignoresSafeArea()
                        }
                        
                        Spacer()
                            .frame(height: 16)
                        
                        VStack(alignment: .leading, spacing: 12) {
                            Text(place.title)
                                .font(.title2)
                                .fontWeight(.semibold)
                            
                            HStack {
                                Image(systemName: "star.fill")
                                Text("4.92")
                                Text("(116 reviews)")
                                Spacer()
                            }
                            
                            Divider()
                            
                            HStack {
                                VStack(alignment: .leading) {
                                    Text("Entire home")
                                        .font(.title3)
                                        .fontWeight(.semibold)
                                    Text("Hosted by Leon")
                                        .font(.subheadline)
                                        .foregroundStyle(.gray.opacity(0.7))
                                }
                                
                                Spacer()
                                
                                Image("sergio-de-paula-c_GmwfHBDzk-unsplash")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 48, height: 48)
                                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                            }
                            
                            Divider()
                            
                            VStack(alignment: .leading) {
                                Text("Amenities")
                                    .font(.title3)
                                    .fontWeight(.semibold)
                                
                                Spacer()
                                    .frame(height: 16)
                                
                                VStack(alignment: .leading, spacing: 24) {
                                    ForEach(amenities[..<4], id: \.self) { amenity in
                                        HStack {
                                            Image(systemName: amenity.image)
                                            Spacer()
                                                .frame(width: 16)
                                            Text(amenity.title)
                                        }
                                    }
                                    NavigationLink(destination: AmenitiesView(amenities: amenities)) {
                                        Spacer()
                                        Text("See all \(amenities.count) amenities")
                                            .foregroundStyle(.black)
                                            .bold()
                                        Spacer()
                                    }
                                        .frame(height: 60)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 10)
                                                .stroke(.black)
                                        )
                                    
                                    Divider()
                                    
                                    VStack(alignment: .leading, spacing: 8) {
                                        HStack(alignment: .center) {
                                            Image(systemName: "tray.and.arrow.down")
                                                .frame(width: 16, height: 16)
                                            Text("Self check-in")
                                                .fontWeight(.semibold)
                                        }
                                        Text("Check yourself in with the lockbox")
                                            .font(.caption)
                                            .foregroundStyle(.gray.opacity(0.7))
                                    }
                                    
                                    VStack(alignment: .leading, spacing: 8) {
                                        HStack(alignment: .center) {
                                            Image(systemName: "entry.lever.keypad")
                                                .frame(width: 16, height: 16)
                                            Text("Great check-in experience")
                                                .fontWeight(.semibold)
                                        }
                                        Text("100% of recent guests gave the check-in process a 5-star rating")
                                            .font(.caption)
                                            .foregroundStyle(.gray.opacity(0.7))
                                    }
                                    
                                    Divider()
                                    
                                    VStack(alignment: .leading, spacing: 16) {
                                        HStack {
                                            VStack(alignment: .leading, spacing: 8) {
                                                Text("Hosted by Leon")
                                                    .font(.title3)
                                                    .fontWeight(.semibold)
                                                Text("Joined in September 2023")
                                                    .font(.caption)
                                                    .foregroundStyle(.gray.opacity(0.8))
                                            }
                                            
                                            Spacer()
                                            
                                            Image("sergio-de-paula-c_GmwfHBDzk-unsplash")
                                                .resizable()
                                                .aspectRatio(contentMode: .fill)
                                                .frame(width: 48, height: 48)
                                                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                                        }
                                        
                                        VStack(alignment: .leading, spacing: 8) {
                                            Text("Response rate: 70%")
                                                .font(.caption)
                                            Text("Response time: within an hour")
                                                .font(.caption)
                                        }
                                        
                                        Button {
                                        } label: {
                                            Spacer()
                                            Text("Contact")
                                                .foregroundStyle(.black)
                                                .bold()
                                            Spacer()
                                        }
                                            .frame(height: 60)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 10)
                                                    .stroke(.black)
                                            )
                                    }
                                }
                            }
                        }
                        .padding(.horizontal, 24)
                        .padding(.bottom, 128)
                    }
                    .ignoresSafeArea()
                    
                    Color.black.opacity(0.8)
                        .overlay {
                            HStack {
                                VStack(alignment: .leading) {
                                    Text("19 - 21 Oct • 3 nights")
                                        .font(.caption)
                                        .foregroundStyle(.gray.opacity(0.8))
                                    
                                    Text("€\(NSNumber(value: place.pricePerNight).intValue)")
                                        .font(.title3)
                                        .fontWeight(.semibold)
                                        .foregroundStyle(.white)
                                }
                                
                                Spacer()
                                
                                NavigationLink(destination: Availability()) {
                                    Text("Book now")
                                        .foregroundStyle(.black)
                                        .bold()
                                        .frame(width: 120, height: 50)
                                        .background(.white)
                                        .clipShape(RoundedRectangle(cornerRadius: 50))
                                }
                            }
                            .padding(.trailing, 10)
                            .padding(.leading, 24)
                        }
                        .frame(height: 70)
                        .background(.ultraThinMaterial)
                        .cornerRadius(35)
                        .padding(.horizontal, 24)
                        .modifier(SlideInModifier(offsetY: 100, animation: .spring().delay(0.1)))
                }
                .modifier(SlideInModifier(opacity: 0, offsetY: 0, animation: .easeIn(duration: 0.2).delay(0.1)))
            }
            .toolbar {
                ToolbarItem(placement: ToolbarItemPlacement.topBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Color.black.opacity(offset > 200 ? 1 : 0)
                            .overlay {
                                Image(systemName: "xmark")
                                    .imageScale(.small)
                                    .foregroundStyle(.white)
                            }
                            .frame(width: 32, height: 32)
                            .background(offset > 200 ? .thinMaterial : .ultraThinMaterial)
                            .clipShape(Circle())
                    }
                }
                ToolbarItem(placement: ToolbarItemPlacement.topBarTrailing) {
                    Button {
                    } label: {
                        Color.black.opacity(offset > 200 ? 1 : 0)
                            .overlay {
                                Image(systemName: "heart")
                                    .imageScale(.small)
                                    .foregroundStyle(.white)
                            }
                            .frame(width: 32, height: 32)
                            .background(offset > 200 ? .thinMaterial : .ultraThinMaterial)
                            .clipShape(Circle())
                    }
                }
                ToolbarItem(placement: ToolbarItemPlacement.topBarTrailing) {
                    Button {
                        dismiss()
                    } label: {
                        Color.black.opacity(offset > 200 ? 1 : 0)
                            .overlay {
                                Image(systemName: "square.and.arrow.up")
                                    .imageScale(.small)
                                    .foregroundStyle(.white)
                            }
                            .frame(width: 32, height: 32)
                            .background(offset > 200 ? .thinMaterial : .ultraThinMaterial)
                            .clipShape(Circle())
                    }
                }
            }
            .toolbarBackground(.hidden)
        }
    }
}

struct ScrollViewOffsetPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = .zero
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        defaultValue += nextValue()
    }
}

#Preview {
    DetailPlaceView(place: Place(image: "https://plus.unsplash.com/premium_photo-1680100256112-2e1231d9d0df?q=80&w=2787&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", title: "Tiny home in Kungsholmen", amenities: "1 guest • 1 bedroom • 1 bed • 1 bathroom", pricePerNight: 100, hasDiscount: true))
}
