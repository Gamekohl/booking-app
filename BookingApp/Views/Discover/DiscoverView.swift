//
//  DiscoverView.swift
//  BookingApp
//
//  Created by Julian on 19.12.23.
//

import SwiftUI

struct DiscoverView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                Header()
                MostRelevantView()
                NewPlacesView()
            }
            .background(.scaffold)
            .ignoresSafeArea()
        }
    }
}

#Preview {
    DiscoverView()
}
