//
//  SearchBar.swift
//  BookingApp
//
//  Created by Julian on 20.12.23.
//

import SwiftUI

struct SearchBar: View {
    var body: some View {
        NavigationLink(destination: Search()) {
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
        .buttonStyle(PlainButtonStyle())
        .transition(.opacity.combined(with: .slide).animation(.easeInOut))
    }
}

#Preview {
    SearchBar()
}
