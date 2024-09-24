//
//  ContentView.swift
//  UdemySwiftUICookbook
//
//  Created by yohei on 2024/09/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hey")
    }
}

#Preview {
    ContentView()
}





struct Post: Identifiable {
    let id = UUID()
    let title: String
    let comments: [Comment]
}


struct Comment: Identifiable {
    let id = UUID()
    let title: String
}





struct CommentView: View {

    let posts = [
        Post(title: "Hello, World!", comments: [.init(title: "Comment 1 for Post 1"), .init(title: "Commont 2 for Post 1")]),
        Post(title: "Hello, SwiftUI!", comments: [.init(title: "Comment 1 for Post 2"), .init(title: "Commont 2 for Post 2")])
    ]



    var body: some View {
        List {
            ForEach(posts) { post in
                Section(header: Text(post.title)) {
                    ForEach(post.comments) { comment in
                        Text(comment.title)
                    }
                    
                }
            }
        }.listStyle(.grouped)
          
    }
}
#Preview {
    CommentView()
}
