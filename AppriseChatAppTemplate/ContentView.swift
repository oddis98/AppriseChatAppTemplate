//
//  ContentView.swift
//  AppriseChatAppTemplate
//
//  Created by Oddbjørn Almenning on 14/03/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Hello, SwiftUI!")
                .font(.system(size: 24, weight: .semibold))
            Image("SwiftUIImage")
                .shadow(color: .blue, radius: 30, x: 0, y: 0)
            Spacer()
        }
        .padding(.top, 30)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
