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
    
    var places: [Place] = [
        Place(image: "https://plus.unsplash.com/premium_photo-1680100256112-2e1231d9d0df?q=80&w=2787&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", title: "Tiny house in Roelingen", amenities: "4 guests • 2 bedrooms • 2 beds • 1 bathroom", pricePerNight: 91, hasDiscount: false),
        Place(image: "https://plus.unsplash.com/premium_photo-1680100256112-2e1231d9d0df?q=80&w=2787&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", title: "Cozy hideout in the middle of Stockholm", amenities: "2 guests • 1 bedroom • 1 bed • 1 bathroom", pricePerNight: 245, hasDiscount: true),
        Place(image: "https://plus.unsplash.com/premium_photo-1680100256112-2e1231d9d0df?q=80&w=2787&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", title: "Tiny house in Roelingen", amenities: "4 guests • 2 bedrooms • 2 beds • 1 bathroom", pricePerNight: 91, hasDiscount: false),
        Place(image: "https://plus.unsplash.com/premium_photo-1680100256112-2e1231d9d0df?q=80&w=2787&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", title: "Cozy hideout in the middle of Stockholm", amenities: "2 guests • 1 bedroom • 1 bed • 1 bathroom", pricePerNight: 245, hasDiscount: true)
    ]
    
    @ViewBuilder
    func button(type: PlaceType) -> some View {
        Text(type.title)
            .font(.callout)
            .fontWeight(.semibold)
            .foregroundStyle(selectedType.id == type.id ? .white : .black)
            .frame(height: 50)
            .frame(maxWidth: .infinity)
            .padding(.horizontal, 24)
    }
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            ZStack {
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
                    
                    Spacer()
                }
                .padding(.leading, 24)
            }
            
            Spacer()
                .frame(height: 16)
            
            HStack {
                ForEach(PlaceType.allCases, id: \.self) { type in
                    if selectedType.id == type.id {
                        button(type: type)
                            .background(.black)
                            .clipShape(RoundedRectangle(cornerRadius: 30))
                            .onTapGesture {
                                withAnimation(.snappy(duration: 0.1)) {
                                    selectedType = type
                                }
                            }
                    } else {
                        button(type: type)
                            .overlay(RoundedRectangle(cornerRadius: 30)
                                .stroke(.black, lineWidth: 1))
                            .onTapGesture {
                                withAnimation(.snappy(duration: 0.1)) {
                                    selectedType = type
                                }
                            }
                    }
                }
            }
        }
        .modifier(SlideInModifier(animation: .spring().delay(0.2)))
        .padding(.horizontal, 24)
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
