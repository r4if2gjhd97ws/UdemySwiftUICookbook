//
//  ListView.swift
//  UdemySwiftUICookbook
//
//  Created by yohei on 2024/09/21.
//

import SwiftUI

struct FriendA {
    let id = UUID()
    let name: String
}

struct FriendB: Identifiable {
    let id = UUID()
    let name: String
}

struct ListView: View {

    let friendsA: [FriendA] = [
            .init(name: "John"),
            .init(name: "Mary"),
            .init(name: "Steven")
    ]

    let friendsB: [FriendB] = [
            .init(name: "John"),
            .init(name: "Mary"),
            .init(name: "Steven")
    ]


    var body: some View {
        VStack {
            List(1...20, id: \.self) { index in
                Text("\(index)")
            }
            List(friendsA, id: \.id) { friend in
                Text("\(friend.name)")
            }

            List(friendsB) { friend in
                Text("\(friend.name)")
            }

            List(friendsB.indices, id: \.self) { index in
                let friend = friendsB[index]
                HStack {
                    Text("\(index + 1)")
                    Text(friend.name)
                }
            }

        }
    }
}

#Preview {
    ListView()
}

