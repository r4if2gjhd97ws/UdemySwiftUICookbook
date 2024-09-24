//
//  FilterSearchableListView.swift
//  UdemySwiftUICookbook
//
//  Created by yohei on 2024/09/22.
//

import SwiftUI

struct Place: Identifiable {
    let id = UUID()
    let name: String
    let photo: String
}

func getPlaces() -> [Place] {
    return [
        Place(name: "Denver", photo: "denver"),
        Place(name: "Newyork", photo: "ny"),
        Place(name: "Costa Rica", photo: "costa-rica"),
        Place(name: "Seattle", photo: "seattle"),
        Place(name: "Cuba", photo: "cuba")
    ]
}

struct FilterSearchableListView: View {

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
            }.listStyle(.plain)
                .searchable(text: $searchText)
                .onChange(of: searchText, perform: { newValue in
                if !newValue.isEmpty && newValue.count >= 1 {
                    places = places.filter {
                        $0.name.lowercased().hasPrefix(newValue.lowercased())
                    }
                } else {
                    places = getPlaces()
                }
            })
                .navigationTitle("Places")
        }
    }
}

#Preview {
    FilterSearchableListView()
}
