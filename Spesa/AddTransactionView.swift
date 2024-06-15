//
//  AddTransactionView.swift
//  Spesa
//
//  Created by Ankit Yadav on 6/15/24.
//

import SwiftUI
import SwiftData

enum transactionType: String, CaseIterable, Identifiable {
    case Expense = "Expense"
    case Income = "Income"
    
    var id: String { self.rawValue }
}

struct AddTransactionView: View {
    @Environment (\.dismiss) private var dismiss
    @Environment (\.modelContext) private var modelContext
    @Query private var items: [Item]
    
    @State var title: String = ""
    @State var amount: Double = 0.00
    @State var transType: transactionType = .Expense
    
    @Binding var isUpdated: Bool

var body: some View {
    NavigationStack {
        
        VStack {
            Text ("Add new transaction").font(.largeTitle).foregroundStyle(.blue)
            Spacer()
            Picker("Transaction", selection: $transType) {
                ForEach(transactionType.allCases) { ttype in
                    Text(ttype.rawValue).tag(ttype)
                }
            }
            .pickerStyle(.wheel)
            
            TextField("Add title", text: $title)
                .frame(width: 300, height: 50, alignment: .center)
                .border(.blue)
                .multilineTextAlignment(.center)
                .clipShape(.capsule)
            
            TextField("Add amount", value: $amount, format: .number)
                .frame(width: 300, height: 50, alignment: .center)
                .border(.blue)
                .multilineTextAlignment(.center)
                .clipShape(.capsule)
            
            Button(action: {
                addAmount()
                isUpdated = true
                dismiss()
            })
            {Image(systemName: "plus.square").resizable().frame(width: 30, height: 30)}
            
            Spacer()
        }
    }
}

private func addAmount() {
    withAnimation {
        let newItem = Item(title: title, amount: amount, isTransaction: transType.id)
        modelContext.insert(newItem)
    }
}

func customBackButton () {
    dismiss()
}

}

