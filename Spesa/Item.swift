//
//  Item.swift
//  Spesa
//
//  Created by Ankit Yadav on 6/12/24.
//

import Foundation
import SwiftData

@Model
final class Item {
    var title: String
    var amount: Double
    var isTransaction: String
    
    init(title: String, amount: Double, isTransaction: String) {
        self.title = title
        self.amount = amount
        self.isTransaction = isTransaction
    }
}
