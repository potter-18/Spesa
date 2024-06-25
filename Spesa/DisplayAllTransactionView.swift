//
//  DisplayAllTransactionView.swift
//  Spesa
//
//  Created by Ankit Yadav on 6/24/24.
//

import SwiftUI
import SwiftData

struct DisplayAllTransactionView: View {
    @Environment (\.dismiss) private var dismiss
    @Environment (\.modelContext) private var modelContext
    @Query private var items: [Item]
    
    @Binding var againstID: UUID?
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(items) { item in
                        Button(action: {againstID = item.id; dismiss()}, label: {Text("\(item.title) \nAmount: $\(String(format: "%.2f", item.amount))")})
                        
                    }
                }
            }
        }
    }
}
