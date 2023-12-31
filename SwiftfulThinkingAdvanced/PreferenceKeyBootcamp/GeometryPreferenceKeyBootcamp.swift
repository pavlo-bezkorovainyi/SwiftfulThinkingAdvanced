//
//  GeometryPreferenceKeyBootcamp.swift
//  SwiftfulThinkingAdvanced
//
//  Created by Павел Бескоровайный on 04.10.2023.
//

import SwiftUI

struct GeometryPreferenceKeyBootcamp: View {
  @State private var rectSize: CGSize = .zero
  
  var body: some View {
    VStack {
      Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        .frame(width: rectSize.width, height: rectSize.height)
        .background(Color.blue)
        .padding(1)
      Spacer()
      HStack {
        Rectangle()
        GeometryReader { geo in
          Rectangle()
            .updateRectangleGeoSize(geo.size)
        }
        Rectangle()
      }
      .frame(height: 55)
    }
    .onPreferenceChange(RectangleGeometrySizePreferenceKey.self) { value in
      self.rectSize = value
    }
  }
}

struct GeometryPreferenceKeyBootcamp_Previews: PreviewProvider {
  static var previews: some View {
    GeometryPreferenceKeyBootcamp()
  }
}

struct RectangleGeometrySizePreferenceKey: PreferenceKey {
  static func reduce(value: inout CGSize, nextValue: () -> CGSize) {
    value = nextValue()
  }
  
  static var defaultValue: CGSize = .zero
  
  
}



extension View {
  func updateRectangleGeoSize(_ size: CGSize) -> some View {
    preference(key: RectangleGeometrySizePreferenceKey.self, value: size)
  }
}
