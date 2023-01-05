//
//  ContentView.swift
//  ImageLoading
//
//  Created by jiqinqiang on 2023/1/5.
//

import SwiftUI

struct ContentView: View {
    
  @StateObject var items = Remote<[Photo]>(url: URL(string: "https://picsum.photos/v2/list")!) {
    Decoder(data: $0).decode()
  }
  
  var body: some View {
    NavigationView {
      if let photos = items.value {
        List(photos, id: \.id) { photo in
          NavigationLink(photo.author) {
            PhotoView(
              url: URL(string: photo.downloadUrl)!,
              aspectRatio: CGFloat(photo.width / photo.height)
            )
          }
        }
      } else {
        ProgressView()
          .onAppear { items.load() }
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
