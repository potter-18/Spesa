//
//  AddTransactionView.swift
//  Spesa
//
//  Created by Ankit Yadav on 6/15/24.
//

import SwiftUI
import SwiftData

struct TransactionType {
    var title: String
    var tMode: TransactionMode
    
    init(title: String, tMode: TransactionMode) {
        self.title = title
        self.tMode = tMode
    }
}

struct AddTransactionView: View {
    @Environment (\.dismiss) private var dismiss
    @Environment (\.modelContext) private var modelContext
    @Query private var items: [Item]
    
    let AllTransactionOptions: [TransactionType] = [TransactionType(title: "Salary", tMode: .Income), TransactionType(title: "Rembursement", tMode: .Income), TransactionType(title: "Food", tMode: .Expense), TransactionType(title: "Transportation", tMode: .Expense), TransactionType(title: "Grooming", tMode: .Expense), TransactionType(title: "Mobile Phone Recharge", tMode: .Expense), TransactionType(title: "Refund", tMode: .Refund)
    ]
    
    @State var title: String = ""
    @State var amount: Double = 0.00
    @State var transType: TransactionType = TransactionType(title: "", tMode: .Income)
    @State var transactionOptionIndex: Int = 0
    
    @Binding var isUpdated: Bool
    
    @State var againstID: UUID?

var body: some View {
    NavigationStack {
        
        VStack {
            Text ("Add new transaction").font(.largeTitle).foregroundStyle(.blue)
           
            Spacer()
            
            Picker("Transaction", selection: $transactionOptionIndex) {
                ForEach(AllTransactionOptions.indices, id: \.self) { index in
                    Text(AllTransactionOptions[index].title).tag(index)
                }
            }
            .pickerStyle(.menu)
            .onChange(of: transactionOptionIndex, initial: true) {
                transType = AllTransactionOptions[transactionOptionIndex]
            }
 
            if (transType.tMode == .Refund) {
                NavigationLink (destination: DisplayAllTransactionView (againstID: $againstID), label: {Text("Select Transaction against which Refund")})
            }
            
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
        let newItem: Item
        
        if transType.tMode == .Refund {
            newItem = Item(title: title, amount: amount, transactionMode: transType.tMode, transactionOption: transType.title, RefundAgainst: againstID)
        } else {
            newItem = Item(title: title, amount: amount, transactionMode: transType.tMode, transactionOption: transType.title)
        }
        modelContext.insert(newItem)
    }
}

func customBackButton () {
    dismiss()
}

}

