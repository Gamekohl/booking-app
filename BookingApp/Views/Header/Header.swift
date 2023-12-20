//
//  Header.swift
//  BookingApp
//
//  Created by Julian on 18.12.23.
//

import SwiftUI

struct Header: View {
    @State var showProfile = false
    @State var showSearch = false
    
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
                
                SearchBar()
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
