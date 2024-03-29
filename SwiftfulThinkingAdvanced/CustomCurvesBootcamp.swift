//
//  CustomCurvesBootcamp.swift
//  SwiftfulThinkingAdvanced
//
//  Created by Павел Бескоровайный on 23.09.2023.
//

import SwiftUI

struct CustomCurvesBootcamp: View {
  var body: some View {
    ShapeWithArc()
      .stroke(lineWidth: 5)
      .fill(
        LinearGradient(colors: [.purple, .blue], startPoint: .topLeading, endPoint: .bottomTrailing)
      )
      
      .frame(width: 200, height: 200)
      .ignoresSafeArea()
  }
}

struct CustomCurvesBootcamp_Previews: PreviewProvider {
  static var previews: some View {
    CustomCurvesBootcamp()
  }
}


struct ArcSample: Shape {
  func path(in rect: CGRect) -> Path {
    Path { path in
      path.move(to: CGPoint(x: rect.maxX, y: rect.midY))
      path.addArc(
        center: CGPoint(x: rect.midX, y: rect.midY),
        radius: rect.height / 2,
        startAngle: Angle(degrees: 0),
        endAngle: Angle(degrees: 40),
        clockwise: true)
      
    }
  }
}

struct ShapeWithArc: Shape {
  
  func path(in rect: CGRect) -> Path {
    Path { path in
      //top left
      path.move(to: CGPoint(x: rect.minX, y: rect.minY))
      
      //top right
      path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
      
      //mid right
      path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
      
      //bottom
//      path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
      path.addArc(
        center: CGPoint(x: rect.midX, y: rect.midY),
        radius: rect.height / 2,
        startAngle: .zero,
        endAngle: .degrees(180),
        clockwise: false)
      
      //mid left
      path.addLine(to: CGPoint(x: rect.minX, y: rect.midY))
      
      

    }
  }
}

struct QuadSample: Shape {
  func path(in rect: CGRect) -> Path {
    Path { path in
      path.move(to: .zero)
      path.addQuadCurve(
        to: CGPoint(x: rect.midX, y: rect.midY),
        control: CGPoint(x: rect.maxX, y: rect.minY))
    }
  }
}

struct WaterShape: Shape {
  func path(in rect: CGRect) -> Path {
    Path { path in
      path.move(to: CGPoint(x: rect.minX, y: rect.midY))
      
      path.addQuadCurve(
        to: CGPoint(x: rect.midX, y: rect.midY),
        control: CGPoint(x: rect.width * 0.25, y: rect.height * 0.4))
      
      path.addQuadCurve(
        to: CGPoint(x: rect.maxX, y: rect.midY),
        control: CGPoint(x: rect.width * 0.75, y: rect.height * 0.6))
      
      path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
      
      path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
    }
  }
}
