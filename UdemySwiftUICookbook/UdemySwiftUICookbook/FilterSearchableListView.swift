//
//  FilterSearchableListView.swift
//  UdemySwiftUICookbook
//
//  Created by yohei on 2024/09/22.
//

import SwiftUI

struct City: Identifiable {
    let id = UUID()
    let name: String
    let photo: String
}

func getCities() -> [City] {
    return [
        City(name: "Denver", photo: "denver"),
        City(name: "Newyork", photo: "ny"),
        City(name: "Costa Rica", photo: "costa-rica"),
        City(name: "Seattle", photo: "seattle"),
        City(name: "Cuba", photo: "cuba")
    ]
}

struct FilterSearchableListView: View {

    @State private var searchText: String = ""
    @State private var places: [City] = getCities()

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
            }.listStyle(.plain)
                .searchable(text: $searchText)
                .onChange(of: searchText, perform: { newValue in
                if !newValue.isEmpty && newValue.count >= 1 {
                    places = places.filter {
                        $0.name.lowercased().hasPrefix(newValue.lowercased())
                    }
                } else {
                    places = getCities()
                }
            })
                .navigationTitle("Places")
        }
    }
}

#Preview {
    FilterSearchableListView()
}
