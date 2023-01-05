//
//  PhotoView.swift
//  ImageLoading
//
//  Created by jiqinqiang on 2023/1/5.
//

import SwiftUI

struct PhotoView: View {
  
  let aspectRatio: CGFloat
  
  @ObservedObject var image: Remote<UIImage>
  
  var imageOrPlaceholder: Image { image.value.map(Image.init) ?? Image(systemName: "photo") }
  
  init(url: URL, aspectRatio: CGFloat) {
    self.image = Remote(url: url) { UIImage(data: $0) }
    self.aspectRatio = aspectRatio
  }
  
  var body: some View {
    imageOrPlaceholder
      .resizable()
      .foregroundColor(.secondary)
      .aspectRatio(aspectRatio, contentMode: .fit)
      .padding()
      .onAppear { image.load() }
  }
}
