//
//  ClickableListView.swift
//  UdemySwiftUICookbook
//
//  Created by yohei on 2024/09/22.
//

import SwiftUI

struct ClickableListView: View {
    @State private var selectedIndex: Int? = -1
    var body: some View {
        VStack {
            List {
                ForEach(0..<10, id: \.self) { index in
                    HStack {
                        Text("\(index + 1)")
                        Spacer()
                    }
                        .background(.yellow)
                        .contentShape(Rectangle())
                        .onTapGesture {
                        selectedIndex = index
                    }
                }
            }
            selectedIndex.map {
                Text("Selected: \($0 + 1)")
                    .font(.largeTitle)
            }
        }
    }
}

#Preview {
    ClickableListView()
}
