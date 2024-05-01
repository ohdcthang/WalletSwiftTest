//
//  Item.swift
//  Test
//
//  Created by Thang Ho Duc on 01/05/2024.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
