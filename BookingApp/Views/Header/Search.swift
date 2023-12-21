//
//  Search.swift
//  BookingApp
//
//  Created by Julian on 20.12.23.
//

import SwiftUI

struct Search: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var selectedType: PlaceType = .any
    @StateObject private var placeVM = PlaceViewModel()
    
    @ViewBuilder
    func button(type: PlaceType) -> some View {
        Text(type.title)
            .font(.callout)
            .fontWeight(.semibold)
            .foregroundStyle(selectedType.id == type.id ? .white : .black)
            .frame(height: 50)
            .frame(maxWidth: .infinity)
            .padding(.horizontal, 24)
            .onTapGesture {
                selectedType = type
            }
    }
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            ZStack(alignment: .leading) {
                Rectangle()
                    .fill(.white)
                    .background(.thinMaterial)
                    .frame(height: 70)
                    .clipShape(RoundedRectangle(cornerRadius: 50))
                
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundStyle(.mainText)
                    
                    VStack(alignment: .leading) {
                        Text("Norway")
                            .font(.body)
                            .fontWeight(.semibold)
                            .foregroundStyle(.mainText)
                        Text("18 - 21 Oct • 4 guests")
                            .font(.caption)
                            .foregroundStyle(.gray.opacity(0.8))
                    }
                }
                .padding(.leading, 24)
            }
            .padding(.horizontal, 24)
            
            Spacer()
                .frame(height: 16)
            
            HStack {
                ForEach(PlaceType.allCases, id: \.self) { type in
                    if selectedType.id == type.id {
                        button(type: type)
                            .background(.black)
                            .clipShape(RoundedRectangle(cornerRadius: 30))
                    } else {
                        button(type: type)
                            .overlay(RoundedRectangle(cornerRadius: 30)
                                .stroke(.black, lineWidth: 1))
                    }
                }
            }
            .padding(.horizontal, 24)
            
            Spacer()
                .frame(height: 16)
            
            VStack(spacing: 16) {
                ForEach(placeVM.places) { place in
                    PlaceView(place: place, overrideMaxWidth: true)
                }
            }
            .padding(.horizontal, 24)
        }
        .modifier(SlideInModifier(animation: .spring().delay(0.2)))
        .background(.scaffold)
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .imageScale(.small)
                        .foregroundStyle(.black)
                        .frame(width: 32, height: 32)
                        .background(.ultraThinMaterial)
                        .clipShape(Circle())
                }
            }
            ToolbarItem(placement: .topBarTrailing) {
                Button {} label: {
                    Image(systemName: "slider.horizontal.3")
                        .imageScale(.small)
                        .foregroundStyle(.black)
                        .frame(width: 32, height: 32)
                        .background(.ultraThinMaterial)
                        .clipShape(Circle())
                }
            }
        }
        .toolbarBackground(.hidden)
    }
}

enum PlaceType: CaseIterable, Identifiable {
    var id: Self { return self }
    case any
    case room
    case entire
    
    var title: String {
        switch self {
        case .any:
            return "Any"
        case .room:
            return "Room"
        case .entire:
            return "Place"
        }
    }
}

#Preview {
    Search()
}
