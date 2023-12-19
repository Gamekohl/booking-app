//
//  ChipView.swift
//  BookingApp
//
//  Created by Julian on 19.12.23.
//

import Foundation
import SwiftUI

struct ChipView: View {
    let title: String
    
    var body: some View {
        HStack(spacing: 4) {
            Text(title).font(.caption).lineLimit(1)
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 8)
        .foregroundStyle(.black)
        .background(.gray.opacity(0.2))
        .clipShape(RoundedRectangle(cornerRadius: 30))
    }
}
