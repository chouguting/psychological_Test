//
//  testCView.swift
//  psychological_Test
//
//  Created by 周固廷 on 2021/11/26.
//

import SwiftUI

struct testCView: View {
    
    let q1Answer=["衣服","鞋子","帽子"]
    @State var q1SelectedIndex=0
    
    let q2Answer=["把洞堵上","下船游到對岸","請船家滑快一點"]
    @State var q2SelectedIndex=0
    
    @State var q3AnsweredResult=""
    
    let q4Answer=["6700","6094","7450","6805"]
    @State var q4SelectedIndex=0
    
    
    @State var q5AnsweredResult=false
    
    @State var q6AnsweredResult=0
    
    @State var q7AnsweredResult=1
    
    let q8Answer=["新的","舊的"]
    @State var q8SelectedIndex=0
    
    let q9Answer=["小箱子","中箱子","大箱子"]
    @State var q9SelectedIndex=0
    
    let q10Answer=["塑膠","金屬","木頭"]
    @State var q10SelectedIndex=0
    
    let q11Answer=["照相機","一個鐘錶","大皮箱","照明燈","罐頭"]
    @State var q11SelectedIndex=0
    
    @State var showResult=false
    
    @State var resultText=""
    
    func getResultString()->String{
        var resultString=""
        resultString+="你和船夫交換了"
        if(q1SelectedIndex==0){
            resultString+="衣服，代表你認為自由最可貴，所以最害怕因為婚姻失去自由。"
        }else if(q1SelectedIndex==1){
            resultString+="鞋子，代表你認爲物質最重要，害怕婚後無法自由支配金錢。"
        }else{
            resultString+="帽子，代表你害怕每天只能圍繞在柴米油鹽上打轉，害怕失去隨意支配的時間，最終變成一個平凡的黃臉婆。"
        }
        
        resultString+="\n\n船出現破洞時，你選擇了\(q2Answer[q2SelectedIndex])，代表當婚姻出現問題時，你會"
        if(q2SelectedIndex==0){
            resultString+="努力進行修復，通過冷靜的溝通解決婚姻中的問題。"
        }else if(q2SelectedIndex==1){
            resultString+="根據情況而定，如果對方犯了原則性錯誤，會選擇離婚。"
        }else{
            resultString+="反覆強調自己的觀點，雖然想和平解決問題，但會控制不住自己的情緒，亂發脾氣。"
        }
        
        resultString+="\n\n到了對岸時，你說了\"\(q3AnsweredResult)\"，這也就是你對婚姻的感想"
        
        resultString+="\n\n開門時，你認為密碼是：\(q4Answer[q4SelectedIndex])，選這組密碼的人對愛情的想法是："
        if(q4SelectedIndex==0){
            resultString+="努力進行修復，通過冷靜的溝通解決婚姻中的問題。"
        }else if(q4SelectedIndex==1){
            resultString+="渴望被別人呵護疼愛。"
        }else if(q4SelectedIndex==2){
            resultString+="不想為了愛情放棄自由。"
        }else{
            resultString+="很孤獨，特別想結婚。"
        }
        
        resultString+="\n\n你認為屋子裡的水桶"
        resultString+=(q5AnsweredResult ? "有水" : "沒水")+"，代表你對你的生活是"
        resultString+=(q5AnsweredResult ? "滿意" : "不滿意")+"的"
        
        resultString+="\n\n瀑布的水流速是:\(q6AnsweredResult)，表示著你對性的慾望程度是\(q6AnsweredResult)/9，"
        if(q6AnsweredResult==0){
            resultString+="你幾乎沒有性慾。"
        }else if(q6AnsweredResult>=1 && q6AnsweredResult<=4){
            resultString+="你的性慾很低。"
        }else if(q6AnsweredResult==5){
            resultString+="你有一般般的性慾望。"
        }else{
            resultString+="你有著強烈的性慾。"
        }
        
        resultString+="\n\n你認為有\(q7AnsweredResult)個鑰匙被串再一起，這和你對朋友的看法有關:"
        if(q7AnsweredResult==1){
            resultString+="一個鑰匙代表你只有一個真正的好朋友。"
        }else if(q7AnsweredResult>1 && q7AnsweredResult<=5){
            resultString+="\(q7AnsweredResult)個鑰匙代表你認為朋友貴精不貴多，所以你的真心朋友雖然不多，但各個可以兩肋插刀。"
        }else{
            resultString+="\(q7AnsweredResult)個鑰匙代表你生活中有許多好朋友，但真正能說句心裡話的卻很少，這使你經常感到寂寞。"
        }
        
        resultString+="\n\n你認為熱氣球是\(q8Answer[q8SelectedIndex])，這說明"
        if(q8SelectedIndex==0){
            resultString+="你以前交往的戀人帶給你很多美好的記憶，即時你們已經分開了，你還是會永遠記住這個人。"
        }else{
            resultString+="過去的戀人帶給你很多傷害，甚至這種傷害讓你對愛情的看法產生了很大的改變。"
        }
        
        resultString+="\n\n箱子的大小，代表你的自負程度，你選了\(q9Answer[q9SelectedIndex])，代表"
        if(q9SelectedIndex==0){
            resultString+="你比較謙遜，明白「人外有人，天外有天」的道理。"
        }else if(q9SelectedIndex==1){
            resultString+="你比較自負，但不自大。你會透過努力讓自己成為被他人羨慕的人。"
        }else{
            resultString+="你特別自負，天老大、地老二，你就是老三。"
        }
        
        resultString+="\n\n箱子的材質是\(q10Answer[q10SelectedIndex])，代表你的感情"
        if(q10SelectedIndex==0){
            resultString+="看似很堅固，可遇到問題時一碰即碎。"
        }else if(q10SelectedIndex==1){
            resultString+="很穩固，不過生活裡缺少一些浪漫的儀式感。"
        }else{
            resultString+="目前正處於磨合期，會發現彼此觀念上存在一些差異。不過若好好溝通，這些問題都可以解決的。"
        }
        
        resultString+="\n\n你拋下的物品和你面臨的難題有關，你選擇拋下了\(q11Answer[q11SelectedIndex])，代表"
        if(q11SelectedIndex==0){
            resultString+="你處在迷茫之中，正在為未來而煩惱。"
        }else if(q11SelectedIndex==1){
            resultString+="你最近身體狀況不太好，如果不舒服別硬撐，快去看醫生。"
        }else if(q11SelectedIndex==2){
            resultString+="最近特別缺錢，所以正在為錢的事情發愁。"
        }else if(q11SelectedIndex==3){
            resultString+="你正被家庭問題所困擾，或者說最近和親人因為觀念不同而產生矛盾。"
        }else{
            resultString+="你正在為異性問題而煩惱，你可能想要脫單，或正準備為感情間做下某個重要決定。"
        }
        
        
        return resultString
    }
    
    
    var body: some View {
        Form {
            Group {
                Text("你身處河岸邊上，想要渡河到對岸。這時河上駛來了一艘船，船上只有漁夫一人。")
                Section{
                    Text("船夫說：「你可以坐上我的船，但要以身上的一樣物品交換。」那樣物品會是什麼呢？")
                    Picker(selection: $q1SelectedIndex) {
                        ForEach(q1Answer.indices){
                            i in
                            Text(q1Answer[i])
                        }
                    } label: {
                        Text("Choose")
                    }.pickerStyle(.segmented)
                }
                
                Section{
                    Text("船行駛到河中央，你發現船底開了一個洞。這時你會怎麼辦？")
                    Picker(selection: $q2SelectedIndex) {
                        ForEach(q2Answer.indices){
                            i in
                            Text(q2Answer[i])
                        }
                    } label: {
                        Text("Choose")
                    }.pickerStyle(.menu)
                }
                
                Section{
                    Text("終於到達了對岸。這時你會說句什麼呢（小聲低咕）？")
                    TextEditor(text: $q3AnsweredResult).frame(height:100)
//                    TextField("請輸入你會說的話",text: $q3AnsweredResult,prompt: Text("請輸入你會說的話")).textFieldStyle(.roundedBorder)
                }
                
                Section{
                    Text("你上岸之後，發現有一條小路，沿著這條路一直走，你看到一間小屋，這間小屋要用密碼才能打開。下面這4組密碼，你認為哪個是正確的？？")
                    Picker(selection: $q4SelectedIndex) {
                        ForEach(q4Answer.indices){
                            i in
                            Text(q4Answer[i])
                        }
                    } label: {
                        Text("Choose")
                    }.pickerStyle(.wheel).frame(height:80)
                }
            }
            
            
            Section{
                Text("你打開門走進入後，發現屋子裡空蕩蕩的，但是在屋子中央有一個水桶。你認為水桶裡有水嗎？")
                
                Toggle((q5AnsweredResult ? "有水" : "沒水"), isOn: $q5AnsweredResult)
                
            }
            
            Section{
                Text("你走出屋子，繼續向前走，發現前面有一個瀑布。你認爲這個瀑布的水流速度是多少？")
                Stepper(value: $q6AnsweredResult, in: 0...9,step: 1) {
                    Text("流速:\(q6AnsweredResult)")
                }
            }
            
            Section{
                Text("在陽光的照耀下，瀑布的水流散發著美麗的光芒。你看完這美景，你準備繼續向前走，卻發現地上有一把鑰匙串。你認為有多少鑰匙被串在一起呢？")
                Stepper(value: $q7AnsweredResult, in: 1...10,step: 1) {
                    Text("鑰匙數:\(q7AnsweredResult)")
                }
            }
            
            Section{
                Text("再繼續向前走，突然發現眼前出現一個熱氣球。你認為這個熱氣球是？")
                Picker(selection: $q8SelectedIndex) {
                    ForEach(q8Answer.indices){
                        i in
                        Text(q8Answer[i])
                    }
                } label: {
                    Text("Choose")
                }.pickerStyle(.segmented)
            }
            
            Section{
                Text("你圍繞著熱氣圈走了一圈，發現旁邊有個箱子。你覺得這個箱子的尺寸是？")
                Picker(selection: $q9SelectedIndex) {
                    ForEach(q9Answer.indices){
                        i in
                        Text(q9Answer[i])
                    }
                } label: {
                    Text("Choose")
                }.pickerStyle(.segmented)
                Text("你覺得這個箱子的材質是什麼？")
                Picker(selection: $q10SelectedIndex) {
                    ForEach(q10Answer.indices){
                        i in
                        Text(q10Answer[i])
                    }
                } label: {
                    Text("Choose")
                }.pickerStyle(.segmented)
            }
            
            Section{
                Text("你準備乘著熱氣球旅行，但發現因為超重無法起飛。下面有5樣東西，你會先拋下哪樣物品來減輕重量呢？")
                Picker(selection: $q11SelectedIndex) {
                    ForEach(q11Answer.indices){
                        i in
                        Text(q11Answer[i])
                    }
                } label: {
                    //Text("你要拋下的是\(q11Answer[q11SelectedIndex])")
                    Text("")
                }.pickerStyle(.menu)
        
            }
            
            Button {
                resultText=getResultString()
                showResult=true
            } label: {
                Text("查看結果").font(.title2)
            }.fullScreenCover(isPresented: $showResult) {
                TestResultView(showString: $resultText,showResult: $showResult)
            }
            
        
        }.navigationTitle("精準解析人格特質、戀愛觀")
    }
}

struct testCView_Previews: PreviewProvider {
    static var previews: some View {
        testCView()
    }
}
