//
//  SwipActionListView.swift
//  UdemySwiftUICookbook
//
//  Created by yohei on 2024/09/22.
//

import SwiftUI

struct SwipActionListView: View {

    @State private var searchText: String = ""
    @State private var places: [Place] = getPlaces()

    var body: some View {
        NavigationView {
            List (places) { place in
                HStack(alignment: .top) {
                    Image(place.photo)
                        .resizable()
                        .frame(maxWidth: 100, maxHeight: 100)
                        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                    Text(place.name)
                        .font(.title)
                }
                    .swipeActions(edge: .leading) {
                    Button {

                    } label: {
                        Label("Heart", systemImage: "heart.circle")
                    }
                }
            }.listStyle(.plain)
                .navigationTitle("Places")
        }
    }
}

#Preview {
    SwipActionListView()
}
