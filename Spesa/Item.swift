//
//  Item.swift
//  Spesa
//
//  Created by Ankit Yadav on 6/12/24.
//

import Foundation
import SwiftData

enum TransactionMode: Int, Codable {
    case Expense
    case Income
}

@Model
final class Item {
    var title: String
    var amount: Double
    var transactionMode: TransactionMode
    var transactionOption: String
    
    init(title: String, amount: Double, transactionMode: TransactionMode, transactionOption: String) {
        self.title = title
        self.amount = amount
        self.transactionMode = transactionMode
        self.transactionOption = transactionOption
    }
}
