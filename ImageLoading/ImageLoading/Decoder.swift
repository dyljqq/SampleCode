//
//  Decoder.swift
//  ImageLoading
//
//  Created by jiqinqiang on 2023/1/5.
//

import Foundation

struct Decoder {
  
  let data: Data
  let decoder: JSONDecoder = JSONDecoder()
  
  init(data: Data) {
    self.data = data
    decoder.keyDecodingStrategy = .convertFromSnakeCase
  }
  
  func decode<T: Codable>() -> T? {
    do {
      return try decoder.decode(T.self, from: data)
    } catch {
      print("decode error: \(error)")
    }
    return nil
  }
  
}
