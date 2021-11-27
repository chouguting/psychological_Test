//
//  testDView.swift
//  psychological_Test
//
//  Created by 周固廷 on 2021/11/27.
//

import SwiftUI
import MapKit

struct testDView: View {
    
    @State var q1InputText=""
    
    @State var q2Date=Date()
    
    @State var q3Choice=false
    @State var q4Choice=false
    @State var q5Choice=false
    
    @State var showResult=false
    @State var resultText=""
    
    @FocusState var nameIsFocused:Bool
    
    
    
    
    let wordBank=["仲冬癸水秉令，局無木生火，壬水發露水勢強盛性剛猛，離火目，水旺者喜木吐秀生火調息，卯運五年得際遇。","明年的運勢吉中帶凶，因為歲破，易謀事不遂，還要防小人。","命格不錯，就只是大運一般，打工較好","寒木向陽坐木局，金生水寒，行運得火去庚申之病，得藥去病則騰身。","燥土喜潤，則金水木順行，欲求富貴，隔運 己亥、庚子、辛丑顯著。","凡事別急，男伴睜大眼睛慢慢物色，實實在在的實踐目標就好，對未來太好高騖遠反而會讓妳跌一跤喔。"]
    
    func getResultString()->String{
        let choosenNum=Int.random(in: 0...wordBank.count-1)
        return q1InputText+"你好,\n根據你的生日和一些有用資訊, "+wordBank[choosenNum]
    }
    
    var body: some View {
        
        
        Form {
            Section {
                Text("你的名字是什麼")
                TextField("請輸入", text: $q1InputText, prompt: Text("請輸入")).focused($nameIsFocused)
            }
            
            Section {
                Text("你的生日是什麼時候")
                DatePicker("請選擇日期", selection: $q2Date,displayedComponents: .date).datePickerStyle(.graphical)
            }
            
            DisclosureGroup("更多選項"){
                VStack{
                    Toggle("性別：\(q3Choice ? "男生" : "女生")", isOn: $q3Choice)
                    Toggle("還是學生嗎？ \(q4Choice ? "是學生" : "己經畢業了")", isOn: $q4Choice).onChange(of: q4Choice) { newValue in
                        if(newValue){
                            q1InputText+="同學"
                        }
                    }
                    
                }
            }
            
            
            Section{
                Button {
                    nameIsFocused=false
                    resultText=getResultString()
                    showResult=true
                } label: {
                    Text("查看結果").font(.title2)
                }.sheet(isPresented: $showResult) {
                    TestResultView(showString: $resultText, showResult: $showResult)
                }
            }
            
            
        }.navigationTitle("用你的姓名和生日看你的未來")
    }
}

struct testDView_Previews: PreviewProvider {
    static var previews: some View {
        testDView()
    }
}
