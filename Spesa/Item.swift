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
    case Refund
}

@Model
final class Item: Identifiable {
    var id = UUID()
    var title: String
    var amount: Double
    var transactionMode: TransactionMode
    var transactionOption: String
    var RefundAgainst: UUID?
    
    init(id: UUID = UUID(), title: String, amount: Double, transactionMode: TransactionMode, transactionOption: String, RefundAgainst: UUID? = nil) {
        self.id = id
        self.title = title
        self.amount = amount
        self.transactionMode = transactionMode
        self.transactionOption = transactionOption
        self.RefundAgainst = RefundAgainst
    }
}
