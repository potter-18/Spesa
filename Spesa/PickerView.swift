//
//  PickerView.swift
//  Spesa
//
//  Created by Ankit Yadav on 6/17/24.
//

import SwiftUI

enum Topping {
    case nuts, cookies, crumble, cherries, blueberry
}

struct PickerView:View {
    @State private var selectedTopping: Topping = .blueberry
    @State private var description: String = "hjb"

    var body: some View {
        
        NavigationStack {
            VStack {
                    Picker("Topping", selection: $selectedTopping) {
                        Text("nuts").tag(Topping.nuts)
                        Text("cookies").tag(Topping.cookies)
                        Text("crumble").tag(Topping.crumble)
                        Text("cherries").tag(Topping.cookies)
                        Text("blueberry").tag(Topping.blueberry)
                    }
                    .pickerStyle(.wheel)
                    .frame(width: 300, height: 150)
            }
            VStack {
                TextField("Description", text: $description)
                    .frame(width: 300, height: 40)
                    .multilineTextAlignment(.center)
                    .border(.black)
                    .presentationCornerRadius(100)
                
            }
        }
    }
}

#Preview {
    PickerView()
        .modelContainer(for: Item.self, inMemory: true)
}
