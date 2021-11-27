//
//  TestResultView.swift
//  psychological_Test
//
//  Created by 周固廷 on 2021/11/25.
//

import SwiftUI

struct TestResultView: View {
    @Binding var showString:String  //這邊如果不用binding他會有bug
    @Binding var showResult:Bool
    var body: some View {
        NavigationView{
            ScrollView() {
                Text("\(showString)").font(.title2).padding()
                Button {
                    showResult=false
                } label: {
                    Text("關閉").font(.headline)
                }.buttonStyle(.bordered)

            }.navigationTitle("測驗結果")
        }
    }
}

struct TestResultView_Previews: PreviewProvider {
    @State static var StrTest = "hello"
    @State static var valueTest = true
    static var previews: some View {
        TestResultView(showString: $StrTest,showResult: $valueTest)
    }
}
