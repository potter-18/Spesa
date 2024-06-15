//
//  ContentView.swift
//  Spesa
//
//  Created by Ankit Yadav on 6/12/24.
//

import SwiftUI
import SwiftData


struct SpesaView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]
    
    @State var isUpdated = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    Text("Spesa").font(.largeTitle).foregroundStyle(.blue)
                    Text("Balance: $\(getTotalBalance())").font(.largeTitle).foregroundStyle(.red)
                    List {
                        ForEach(items) { item in
                            NavigationLink(destination: Text("\(item.title) \nAmount: $\(String(format: "%.2f", item.amount))"), label: {Text("\(item.title) \nAmount: $\(String(format: "%.2f", item.amount))")})
                        }
                        .onDelete(perform: deleteTransaction)
                    }
                }
                
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        NavigationLink(destination: {AddTransactionView(isUpdated: $isUpdated)}, label: {Image(systemName: "apple.meditate").resizable().frame(width: 30, height: 30)})
                        Spacer()
                    }
                }
            }
        }
        
    }
    
    func getTotalBalance () -> String {
        
        var balance = 0.0
        
        for item in items {
            if item.isTransaction == "Expense" {
                balance -= item.amount
            } else {
                balance += item.amount
            }
        }
        
        return String(format: "%.2f", balance)
    }
    
    func deleteTransaction (offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(items[index])
            }
        }
    }
}
    
    #Preview {
        SpesaView(isUpdated: false)
            .modelContainer(for: Item.self, inMemory: true)
    }
