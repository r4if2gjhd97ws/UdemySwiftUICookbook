//
//  InfiniteScrollingListView.swift
//  UdemySwiftUICookbook
//
//  Created by yohei on 2024/09/29.
//

import SwiftUI

struct InfiniteScrollingListView: View {
    @StateObject private var numberListVM = NumberListViewModel()
    @State private var currentPage: Int = 1
    
    var body: some View {
        List(numberListVM.numbers, id: \.self) { number in
            Text("- \(number)")
                .onAppear {
                    if numberListVM.shouldLoadData(id: number) {
                        currentPage += 1
                        numberListVM.populateDate(page: currentPage)
                    }
                }

        }.onAppear {
            numberListVM.populateDate(page: 1)
        }
    }
}

#Preview {
    InfiniteScrollingListView()
}
