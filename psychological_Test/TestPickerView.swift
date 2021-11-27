//
//  TestPickerView.swift
//  psychological_Test
//
//  Created by 周固廷 on 2021/11/25.
//

import SwiftUI

struct TestPickerView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink {
                    testAView()
                } label: {
                    Text("你在別人眼中是怎樣的人？")
                }
                
                NavigationLink {
                    testBView()
                } label: {
                    Text("你內心有什麼真實慾望？")
                }
                
                NavigationLink {
                    testCView()
                } label: {
                    Text("精準解析人格特質、戀愛觀")
                }
                
                NavigationLink {
                    testDView()
                } label: {
                    Text("用你的姓名和生日看你的未來")
                }
                
                NavigationLink {
                    testEView()
                } label: {
                    Text("我是誰？我在哪裡？")
                }
            }.navigationTitle("選擇測驗")
        }
    }
}

struct TestPickerView_Previews: PreviewProvider {
    static var previews: some View {
        TestPickerView()
    }
}
