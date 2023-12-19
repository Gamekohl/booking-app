//
//  Header.swift
//  BookingApp
//
//  Created by Julian on 18.12.23.
//

import SwiftUI

struct Header: View {
    @State var showProfile = false
    
    var body: some View {
        ZStack(alignment: .center) {
            Image("ian-keefe-OgcJIKRnRC8-unsplash")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 300)
                .clipShape(.rect())
            
            VStack(alignment: .leading, spacing: 32) {
                HStack {
                    Button {
                        
                    } label: {
                        Image(systemName: "location.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                    }
                    .foregroundStyle(.white)
                    Spacer()
                    Button {
                        withAnimation {
                            showProfile = true
                        }
                    } label: {
                        Image(systemName: "person.circle")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                    }
                    .foregroundStyle(.white)
                }
                .padding(.horizontal, 24)
                
                Text("Tell us where you want to go")
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .padding(.horizontal, 24)
                
                ZStack(alignment: .leading) {
                    Rectangle()
                        .background(.ultraThinMaterial)
                        .clipShape(
                            RoundedRectangle(cornerRadius: 50)
                        )
                        .frame(height: 60)
                        .padding(.horizontal, 24)
                    
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundStyle(.white)
                        
                        VStack(alignment: .leading) {
                            Text("Search places")
                                .font(.callout)
                                .bold()
                                .foregroundStyle(.white)
                            Text("Date range • Number of guests")
                                .font(.caption2)
                                .fontWeight(.light)
                                .foregroundStyle(.white)
                        }
                    }
                    .padding(.leading, 48)
                }
            }
            .modifier(SlideInModifier())
            .sheet(isPresented: $showProfile, onDismiss: { showProfile = false }) {
                Profile()
            }
        }
    }
}

#Preview {
    Header()
}
