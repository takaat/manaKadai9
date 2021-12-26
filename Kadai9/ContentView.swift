//
//  ContentView.swift
//  Kadai9
//
//  Created by mana on 2021/12/24.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedText = "未選択"
    @State private var isShowModal = false

    var body: some View {
        HStack(spacing: 50.0) {
            Text("都道府県")
            Text(selectedText)
            Button("入力") {
                isShowModal = true
            }
        }
        .fullScreenCover(isPresented: $isShowModal) {
            ModalView(selectedText: $selectedText,
                      isShowModal: $isShowModal)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ModalView: View {
    @Binding var selectedText: String
    @Binding var isShowModal: Bool
    private let prefectures: [String] = ["東京都", "神奈川県", "埼玉県", "千葉県"]

    var body: some View {
        NavigationView {
            VStack(spacing: 25.0) {
                ForEach(prefectures, id: \.self) { prefecture in
                    Button(action: { selectedText = prefecture ; isShowModal = false },
                           label: { Text(prefecture) })
                }
            }.toolbar {
                ToolbarItem(placement: .navigationBarLeading,
                            content: { Button(action: { isShowModal = false },
                                              label: { Text("Cancel") })})
            }
        }
    }
}

struct ModalView_Previews: PreviewProvider {
    static var previews: some View {
        ModalView(selectedText: .constant("東京都"), isShowModal: .constant(true))
    }
}
