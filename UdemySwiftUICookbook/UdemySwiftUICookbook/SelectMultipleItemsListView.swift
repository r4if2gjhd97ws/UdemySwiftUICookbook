//
//  SelectMultipleItemsListView.swift
//  UdemySwiftUICookbook
//
//  Created by yohei on 2024/09/25.
//

import SwiftUI

struct Customer: Identifiable {
    let id = UUID()
    let name: String
}


struct SelectMultipleItemsListView: View {

    @State private var customers = [
        Customer(name: "John"),
        Customer(name: "Alex"),
        Customer(name: "Jane"),
        Customer(name: "Bob"),
        Customer(name: "Alice")
    ]
    
    @State private var selectedCustmorIds: Set<UUID> = []

    var body: some View {
        NavigationView {
            List(customers, selection: $selectedCustmorIds) { customer in
                HStack {
                    Text(customer.name)
                    Spacer()
                }
            }.toolbar {
                EditButton()
            }
            .navigationTitle("Selected: \(selectedCustmorIds.count)")
        }
    }
}

#Preview {
    SelectMultipleItemsListView()
}
