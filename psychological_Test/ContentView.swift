//
//  ContentView.swift
//  psychological_Test
//
//  Created by 周固廷 on 2021/11/25.
//

import SwiftUI

struct ContentView: View {
    @State private var showingTestPicker = false
    
    var body: some View {
        if(showingTestPicker){
            TestPickerView()
        }else{
            HomeView(showingTestPicker: $showingTestPicker)
        }
        
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
.previewInterfaceOrientation(.portrait)
    }
}
