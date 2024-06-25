//
//  DisplayTransactionView.swift
//  Spesa
//
//  Created by Ankit Yadav on 6/23/24.
//

import SwiftUI
import SwiftData

struct DisplayTransactionView: View {
    @Environment (\.modelContext) private var modelContext
    @Query private var items: [Item]
    
    @Binding var isUpdated: Bool
    
    var index: Int
    var showButton = true
    
    var body: some View {
        NavigationStack {
            Text("\(items[index].transactionOption) \n\(items[index].title) \nAmount: $\(String(format: "%.2f", items[index].amount))")
                                            .border(.brown)
                                            .multilineTextAlignment(.center)
            if (showButton) {
                if (items[index].transactionMode == TransactionMode.Expense) {
                    NavigationLink(destination: AddRefund(AgainstTransaction: items[index].id, isUpdated: $isUpdated), label: {Text("Refund")})
                } else if (items[index].transactionMode == TransactionMode.Refund) {
                    NavigationLink(destination: DisplayTransactionView(isUpdated: $isUpdated, index: getIndex(), showButton: false), label: {Text("Agaings Transaction")})
                }
            }
        }
    }
    
    func getIndex () -> Int {
        
        return items.firstIndex(where: {$0.id == items[index].RefundAgainst})!
    }
}
