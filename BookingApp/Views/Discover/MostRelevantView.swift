//
//  MostRelevantView.swift
//  BookingApp
//
//  Created by Julian on 18.12.23.
//

import SwiftUI

struct MostRelevantView: View {
    @StateObject var placeVM = PlaceViewModel()
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Most relevant")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundStyle(.mainText)
                .padding(.horizontal, 24)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(placeVM.places) { place in
                        PlaceView(place: place)
                    }
                }
                .padding(.vertical, 16)
                .padding(.horizontal, 24)
            }
            .padding(.vertical, -8)
        }
        .modifier(SlideInModifier())
    }
}

#Preview {
    MostRelevantView()
}
