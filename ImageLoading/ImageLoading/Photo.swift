//
//  Photo.swift
//  ImageLoading
//
//  Created by jiqinqiang on 2023/1/5.
//

import Foundation

struct Photo: Codable {
  let id: String
  let author: String
  let width: Int
  let height: Int
  let url: String
  let downloadUrl: String
}
