//
//  Remote.swift
//  ImageLoading
//
//  Created by jiqinqiang on 2023/1/5.
//

import Foundation

struct LoadingError: Error {}

final class Remote<T>: ObservableObject {
  
  let url: URL
  let transform: (Data) -> T?
  
  @Published var result: Result<T, Error>? = nil
  var value: T? { try? result?.get() }
  
  init(url: URL, transform: @escaping (Data) -> T?) {
    self.url = url
    self.transform = transform
  }
  
  func load() {
    URLSession.shared.dataTask(with: url) { data, _, _ in
      DispatchQueue.main.async {
        if let data, let v = self.transform(data) {
          self.result = .success(v)
        } else {
          self.result = .failure(LoadingError())
        }
      }
    }.resume()
  }
}
