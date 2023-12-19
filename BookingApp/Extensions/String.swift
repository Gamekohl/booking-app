//
//  String.swift
//  BookingApp
//
//  Created by Julian on 19.12.23.
//

import Foundation
import UIKit

extension String {
    func getSize() -> CGFloat {
        let font = UIFont.systemFont(ofSize: 16)
        let attributes = [NSAttributedString.Key.font: font]
        let size = (self as NSString).size(withAttributes: attributes)
        
        return size.width
    }
}
