//
//  CollapsableHeadersInListView.swift
//  UdemySwiftUICookbook
//
//  Created by yohei on 2024/09/25.
//

import SwiftUI


struct Place: Identifiable {
    let id = UUID()
    let name: String
    let hikes: [Hike]
}

struct Hike: Identifiable {
    let id = UUID()
    let name: String
    
}

struct CollapsableHeadersInListView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    CollapsableHeadersInListView()
}
