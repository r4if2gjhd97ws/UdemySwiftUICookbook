//
//  AutoScrollListView.swift
//  UdemySwiftUICookbook
//
//  Created by yohei on 2024/09/22.
//

import SwiftUI

struct AutoScrollListView: View {
    var body: some View {
        ScrollViewReader { proxy in
            VStack {
                Button("Scroll to 100") {
                    withAnimation {
                        proxy.scrollTo(100, anchor: .center)
                    }
                }
                List(1...500, id: \.self) { index in
                    Text("\(index)")
                        .id(index)
                }
            }
        }
    }
}

#Preview {
    AutoScrollListView()
}

