//
//  TabBar.swift
//  BookingApp
//
//  Created by Julian on 19.12.23.
//

import SwiftUI

struct TabBar: View {
    
    @State var selectedTab = 0
    
    init(selectedTab: Int = 0) {
        self.selectedTab = selectedTab
        
        UITabBar.appearance().shadowImage = UIImage()
        UITabBar.appearance().backgroundImage = UIImage()
        UITabBar.appearance().backgroundColor = .white.withAlphaComponent(0)
    }
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottom){
                TabView(selection: $selectedTab) {
                    DiscoverView()
                        .tag(0)
                    
                    Favorites()
                        .tag(1)
                    
                    MostRelevantView()
                        .tag(2)
                    
                    MostRelevantView()
                        .tag(3)
                }
                .background(.clear)
                
                Color.black.opacity(0.8)
                    .overlay {
                        ZStack{
                            HStack(spacing: 16) {
                                ForEach((TabbedItems.allCases), id: \.self){ item in
                                    Button{
                                        selectedTab = item.rawValue
                                    } label: {
                                        CustomTabItem(imageName: item.iconName, title: item.title, isActive: (selectedTab == item.rawValue))
                                    }
                                }
                            }
                            .padding(6)
                        }
                    }
                    .frame(height: 70)
                    .background(.ultraThinMaterial)
                    .cornerRadius(35)
                    .padding(.horizontal, 26)
            }
        }
    }
}

extension TabBar {
    func CustomTabItem(imageName: String, title: String, isActive: Bool) -> some View {
        VStack(spacing: 10){
            Image(systemName: imageName)
                .resizable()
                .foregroundColor(isActive ? .white : .gray)
                .frame(width: 20, height: 20)
            Text(title)
                .foregroundStyle(isActive ? .white : .gray)
                .font(.caption)
        }
        .frame(width: 60, height: 60)
    }
}

#Preview {
    TabBar()
}
