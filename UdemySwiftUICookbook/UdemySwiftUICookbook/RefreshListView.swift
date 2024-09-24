//
//  RefreshListView.swift
//  UdemySwiftUICookbook
//
//  Created by yohei on 2024/09/21.
//

import SwiftUI

struct RefreshListView: View {
    @State private var refreshDates: [Date] = []



    var body: some View {
        NavigationView {
            List(refreshDates, id: \.self) { date in
                Text("\(date)")

            }.listStyle(.plain)
                .refreshable {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    let currentDate = Date()
                    refreshDates.append(currentDate)
                }
            }
                .navigationTitle("Pull to refresh!")
        }
    }
}

#Preview {
    RefreshListView()
}
