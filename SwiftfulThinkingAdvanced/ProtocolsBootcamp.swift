//
//  ProtocolsBootcamp.swift
//  SwiftfulThinkingAdvanced
//
//  Created by Павел Бескоровайный on 17.03.2024.
//

import SwiftUI

struct DefaultColorTheme: ColorThemeProtocol {
  let primary: Color = .blue
  let secondary: Color = .white
  let tertiary: Color = .gray
}

struct AlternativeColorTheme: ColorThemeProtocol {
  let primary: Color = .red
  let secondary: Color = .white
  let tertiary: Color = .green
}

struct AnotherColorTheme: ColorThemeProtocol {
  let primary: Color = .blue
  let secondary: Color = .red
  let tertiary: Color = .purple
}

protocol ColorThemeProtocol {
  var primary: Color { get }
  var secondary: Color { get }
  var tertiary: Color { get }
}

//extension ColorThemeProtocol {
//  var secondary: Color {
//    .white
//  }
//}

protocol ButtonTextProtocol {
  var buttonText: String { get }
}

protocol ButtonPressedProtocol {
  func buttonPressed()
}

protocol ButtonDataSourceProtocol: ButtonTextProtocol, ButtonPressedProtocol { }

class DefaultDataSource: ButtonDataSourceProtocol {
  var buttonText: String = "Protocols are awesome!"
  
  func buttonPressed() {
    print("Button was pressed")
  }
}

class AlternativeDataSource: ButtonTextProtocol {
  var buttonText: String = "Protocols are lame!"
}

struct ProtocolsBootcamp: View {
  
  let colorTheme: ColorThemeProtocol
  let dataSource: ButtonDataSourceProtocol
  
  
  var body: some View {
    ZStack {
      colorTheme.tertiary.ignoresSafeArea()
      
      Text(dataSource.buttonText)
        .font(.headline)
        .foregroundColor(colorTheme.secondary)
        .padding()
        .background(colorTheme.primary.cornerRadius(10))
        .onTapGesture {
          dataSource.buttonPressed()
        }
    }
  }
}

#Preview {
  ProtocolsBootcamp(colorTheme: DefaultColorTheme(), dataSource: DefaultDataSource())
}
