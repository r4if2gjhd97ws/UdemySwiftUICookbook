//
//  EditableTaskListView.swift
//  UdemySwiftUICookbook
//
//  Created by yohei on 2024/09/21.
//

import SwiftUI



struct EditableTaskListView: View {

    @State private var taskName: String = ""
    @State private var tasks: [String] = []
    private func deleteTask(at indexSet: IndexSet) {
        indexSet.forEach { index in
            tasks.remove(at: index)
        }
    }


    private func moveTask(from source: IndexSet, to destination: Int) {
        tasks.move(fromOffsets: source, toOffset: destination)
    }


    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    TextField("Enter Task Name", text: $taskName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Button("Add Task") {
                        tasks.append(taskName)
                        taskName = ""
                    }
                }
                List {
                    ForEach(tasks, id: \.self) { task in
                        Text(task)
                    }
                    // セルを左スワイプで”削除”ボタンを表示
                    .onDelete(perform: deleteTask(at:))
                    // セルを入れ替え可能にする
                    .onMove(perform: moveTask(from: to:))
                }
                    .listStyle(PlainListStyle())
                    .toolbar {
                    //並べ替え編集ボタン
                    EditButton()
                }

            }.padding()
        }
    }
}

#Preview {
    EditableTaskListView()
}
