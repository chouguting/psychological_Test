//
//  HomeView.swift
//  psychological_Test
//
//  Created by 周固廷 on 2021/11/25.
//

import SwiftUI

struct HomeView: View {
    @Binding var showingTestPicker:Bool
    @State var showThought=false
    var body: some View {
        VStack{
            Image("question").resizable().frame(width: 200, height: 200, alignment: .center).contextMenu(){
                Text("Hmmmmm")
                Button {
                    showThought=true
                } label: {
                    Text("這是什麼？")
                }

            }
            Text("是個心理測驗？？？!").font(.title)
            if(showThought){
                Text("我也不知道").font(.title2)
            }
            
            Button() {
                showingTestPicker=true
            } label: {
                Text("Start").font(.title2)
            }.buttonStyle(.bordered)
        }
        

    }
}

struct HomeView_Previews: PreviewProvider {
    @State static var value = false

    static var previews: some View {
        HomeView(showingTestPicker: $value)
    }
}
