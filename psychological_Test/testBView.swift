//
//  testBView.swift
//  psychological_Test
//
//  Created by 周固廷 on 2021/11/26.
//

import SwiftUI

struct testBView: View {
    @State var selectedIndex=1.0
    
    @State var showAlert=false
    
    @State var resultText=""
    
    func getResultString()->String{
        if(Int(selectedIndex)==1){
            return "選擇①的你，希望別人幫你的事情就是「說出真心話」，你常常需要獲得別人的認同或支持、才可以說出自己的真心話及真實想法，像是向對方傳達自己喜歡的心情、希望對方改正的地方或是尋求對方協助等等，有時候即使是一對一也讓你難以開口的話，如果有人幫你的話可能會很容易就說出來。"
        }
        if(Int(selectedIndex)==2){
            return "選擇②的你，希望別人幫你的事情就是「管理行程」，你似乎覺得如果有一個助手可以幫你安排好一連串協調順暢的行程，對你來說很有幫助，因為你本來就很忙，而「日程管理」這件事本身可能就要花時間，所以你會希望通過良好的設置幫助管理日程安排，同時提供充足的休閒空間。"
        }
        
        if(Int(selectedIndex)==3){
            return "選擇③的你，希望別人幫你的事情就是「準備飯菜」，你特別忙或者累的時候，常常覺得如果有人可以幫忙做飯、準備飯菜就好了，不只是外食，你偶爾也想在家吃家常菜，自己卻懶得全部做，特別是蔬菜去皮等準備起來很麻煩的東西，更希望能得到別人的幫助。"
        }
        
        if(Int(selectedIndex)==4){
            return "選擇④的你，希望別人幫你的事情就是「做家事」，你喜歡乾淨的房間，但是好像不喜歡整理收拾，把壁櫥或衣櫃、抽屜裡面的東西全部拿出來的時候，往往會想著「算了、下次再整理」等等，如果沒有人可以幫助整理和做家務，你可能很難有幹勁。"
        }
        
        if(Int(selectedIndex)==5){
            return "選擇⑤的你，希望別人幫你的事情就是「修理壞掉的東西」，你有像磨損的衣服、壞掉的家具或電器等等吧？雖然還不到完全報廢不能使用，但是自己修理像需要花費時間和精力，找店家維修價格也很貴，如果有人幫忙的話，應該會很順利吧！"
        }
        
        return "選擇⑥的你，希望別人幫你的事情就是「打掃房間」，你希望有人幫你打掃平時不容易清潔到的地方，你不是不喜歡打掃，只是偶爾吹毛求疵、會想要好好打掃一下那些不挪開傢俱的話無法清潔到的部位，想要讓那些隱藏的髒污都變得乾淨。"
    }
    
    var body: some View {
        Form{
            Section {
                Text("憑直覺選擇一位你喜歡的小精靈？").font(.title)
                Image("elfTest").resizable().scaledToFill()
                Text("我的選擇: \(Int(selectedIndex))")
                Slider(value: $selectedIndex, in: 1.0...6.0, step: 1.0) {
                    Text("choose")
                }
            }
            
            Button {
                resultText=getResultString()
                showAlert=true
            } label: {
                Text("查看結果").font(.title2)
            }.alert(getResultString(),isPresented: $showAlert) {
                Button("OK"){}
            }
            
            
        }.navigationTitle("你內心有什麼真實慾望？")
    }
}

struct testBView_Previews: PreviewProvider {
    static var previews: some View {
        testBView()
    }
}
