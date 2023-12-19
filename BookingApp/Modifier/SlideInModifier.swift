//
//  SlideInModifier.swift
//  BookingApp
//
//  Created by Julian on 19.12.23.
//

import Foundation
import SwiftUI

struct SlideInModifier: ViewModifier {
    @State var opacity = 0.0
    @State var offsetY = 10.0
    @State var animation: Animation = .spring
    
    func body(content: Content) -> some View {
        content
            .opacity(opacity)
            .offset(y: offsetY)
            .onAppear {
                withAnimation(animation) {
                    opacity = 1
                    offsetY = 0
                }
            }
    }
}
