//
//  AddRefund.swift
//  Spesa
//
//  Created by Ankit Yadav on 6/23/24.
//

import SwiftUI
import SwiftData

struct AddRefund: View {
    @Environment (\.dismiss) private var dismiss
    @Environment (\.modelContext) private var modelContext
    @Query private var items: [Item]
    
    @State var title: String = ""
    @State var amount: Double = 0.00
    @State var AgainstTransaction: UUID
    
    @Binding var isUpdated: Bool

var body: some View {
    NavigationStack {
        
        VStack {
            Text ("Refund").font(.largeTitle).foregroundStyle(.blue)
            Spacer()
        
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
        let newItem = Item(title: title, amount: amount, transactionMode: .Refund, transactionOption: "Refund", RefundAgainst: AgainstTransaction)
        modelContext.insert(newItem)
    }
}

func customBackButton () {
    dismiss()
}

}

