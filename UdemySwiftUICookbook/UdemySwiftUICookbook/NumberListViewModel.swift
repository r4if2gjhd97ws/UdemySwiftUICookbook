//
//  NumberListViewModel.swift
//  UdemySwiftUICookbook
//
//  Created by yohei on 2024/10/04.
//

import Foundation

class NumberListViewModel: ObservableObject {
    @Published var numbers: [Int] = []

    func populateDate(page: Int) {
        guard let url = URL(string: "https://valley-deluxe-dawn.glitch.me/data?page=\(page)") else {
            return
        }
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data, error == nil else {
                return
            }
            let numbers = try? JSONDecoder().decode([Int].self, from: data)
            DispatchQueue.main.async {
                print(numbers)
//                self.numbers = numbers ?? []
                self.numbers.append(contentsOf: numbers ?? [])
            }
        }.resume()
    }

    func shouldLoadData(id: Int) -> Bool {
        id == numbers.count - 2
    }
}
