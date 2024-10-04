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

private func getAllPlaces() -> [Place] {
    return [
            .init(name: "Tokyo", hikes: [.init(name: "Shinjuku"), .init(name: "Kokubunji")]),
            .init(name: "Osaka", hikes: [.init(name: "Kodama"), .init(name: "Kodama")]),
    ]
}


struct CollapsableHeadersInListView: View {

    @State private var places: [Place] = getAllPlaces()

    @State private var selectedPlace: Place?
    @State private var expanded = false

    var body: some View {
        List(places) { place in
            VStack(alignment: .leading) {

                HStack {
                    Text(place.name)
                        .fontWeight(.bold)
                        .padding(.bottom, 10)
                    Spacer()
                    Image(systemName: expanded ? "chevron.down" : "chevron.right")
                }
                    .onTapGesture {
                    expanded.toggle()
                    selectedPlace = expanded ? place : nil
                }


                if selectedPlace?.name == place.name {

                    ForEach(place.hikes) { hike in
                        Text(hike.name)
                    }

                }

            }
        }
    }
}

#Preview {
    CollapsableHeadersInListView()
}
