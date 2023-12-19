//
//  ChipContainerView.swift
//  BookingApp
//
//  Created by Julian on 19.12.23.
//

import SwiftUI

struct ChipContainerView: View {
    @State private var rows: [[ChipModel]] = []
    @State var chips: [ChipModel] = [
        ChipModel(title: "Wi-Fi"),
        ChipModel(title: "65\" HDTV"),
        ChipModel(title: "Indoor fireplace"),
        ChipModel(title: "Hair dryer"),
        ChipModel(title: "Washing machine"),
    ]
    
    init(chips: [ChipModel]) {
        self.chips = chips
        
        getChips()
    }
    
    var body: some View {
        return GeometryReader { proxy in
            VStack(alignment: .leading, spacing: 4){
                ForEach(rows, id:\.self){ rows in
                    HStack(spacing: 6){
                        ForEach(rows){ row in
                            Text(row.title)
                                .font(.system(size: 16))
                                .padding(.leading, 14)
                                .padding(.trailing, 30)
                                .padding(.vertical, 8)
                                .background(
                                    ZStack(alignment: .trailing){
                                        Capsule()
                                            .fill(.gray.opacity(0.3))
                                        Button{
                                            
                                        } label:{
                                            Image(systemName: "xmark")
                                                .frame(width: 15, height: 15)
                                                .padding(.trailing, 8)
                                                .foregroundColor(.red)
                                        }
                                    }
                                )
                        }
                    }
                    .frame(height: 28)
                    .padding(.bottom, 10)
                }
            }
            .padding(24)
        }
    }
    
    func getChips() {
        var rows: [[ChipModel]] = []
        var currentRow: [ChipModel] = []
        
        var totalWidth: CGFloat = 0
        let screenWidth = UIScreen.main.bounds.size.width - 10
        let tagSpacing: CGFloat = 14 + 30 + 6 + 6
        
        if !chips.isEmpty {
            for index in 0 ..< chips.count {
                self.chips[index].size = chips[index].title.getSize()
            }
            
            chips.forEach { chip in
                totalWidth += (chip.size + tagSpacing)
                
                if totalWidth > screenWidth {
                    totalWidth = (chip.size + tagSpacing)
                    rows.append(currentRow)
                    currentRow.removeAll()
                    currentRow.append(chip)
                } else {
                    currentRow.append(chip)
                }
            }
            
            if !currentRow.isEmpty {
                rows.append(currentRow)
                currentRow.removeAll()
            }
            
            self.rows = rows
        } else {
            self.rows = []
        }
    }
}

#Preview {
    ChipContainerView(chips: [            ChipModel(title: "Wi-Fi"),
                                          ChipModel(title: "65\" HDTV"),
                                          ChipModel(title: "Indoor fireplace"),
                                          ChipModel(title: "Hair dryer"),
                                          ChipModel(title: "Washing machine")])
}
