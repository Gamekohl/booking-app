//
//  DiscoverView.swift
//  BookingApp
//
//  Created by Julian on 19.12.23.
//

import SwiftUI

struct DiscoverView: View {
    @State private var scrollPosition: CGPoint = .zero
    
    var body: some View {
        ScrollView {
            VStack {
                Header()
                
                MostRelevantView()
                    .padding(.vertical, 8)
                NewPlacesView()
                    .padding(.bottom, 128)
            }
            .background(GeometryReader { proxy in
                Color.clear.preference(key: ScrollOffsetPreferenceKey.self, value: proxy.frame(in: .named("scroll")).origin)
            })
            .onPreferenceChange(ScrollOffsetPreferenceKey.self) { value in
                self.scrollPosition = value
            }
        }
        .overlay(alignment: .top) {
            if (scrollPosition.y < -300) {
                SearchBar()
                    .padding(.top, 64)
            }
        }
        .coordinateSpace(name: "scroll")
        .background(.scaffold)
        .ignoresSafeArea()
    }
}

struct ScrollOffsetPreferenceKey: PreferenceKey {
    static var defaultValue: CGPoint = .zero
    
    static func reduce(value: inout CGPoint, nextValue: () -> CGPoint) {
    }
}

#Preview {
    DiscoverView()
}
