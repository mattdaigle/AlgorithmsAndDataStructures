//
//  CodeDetailsView.swift
//  AlgorithmsAndDataStructures
//
//  Created by Matt Daigle on 7/27/24.
//

import HighlightSwift
import SwiftUI

struct CodeDetailsView: View {

    @State var code: String

    var body: some View {
        ZStack {
            Color.draculaBackground
                .ignoresSafeArea()
            ScrollView {
                CodeText(code)
                    .codeTextLanguage(.swift)
                    .codeTextColors(.custom(dark: .custom(css: draculaThemeCSS), light: .custom(css: draculaThemeCSS)))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
            }
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    CodeDetailsView(code: "Test Code")
}
