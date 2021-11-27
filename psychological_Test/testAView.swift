//
//  testA.swift
//  psychological_Test
//
//  Created by 周固廷 on 2021/11/25.
//

import SwiftUI

struct testAView: View {
    
    let q1Answer=["早上","下午","晚上"]
    @State var q1SelectedIndex=0
    let q1Score=[2,4,6]
    
    let q2Answer=["步伐快，步幅大","步伐快，步幅少","看著地下，步伐不快","步伐很慢"]
    @State var q2SelectedIndex=0
    let q2Score=[6,4,7,2,1]
    
    let q3Answer=["把雙手翹著","雙方合十","一隻手或雙手放在腰上","用手推或牽制對方","一邊用手摸耳朵或下巴，再用另一隻手玩弄頭髮"]
    @State var q3SelectedIndex=0
    let q3Score=[4,2,5,7,6]
    
    let q4Answer=["躺著並把腳曲起來","二郎腿","伸直雙腳","一隻腳曲起，一隻腳伸直"]
    @State var q4SelectedIndex=0
    let q4Score=[4,6,2,1]
    
    let q5Answer=["不會隱藏自己的笑聲，豪邁地笑","會笑，但不會太大聲","靜靜地笑","害羞地微笑"]
    @State var q5SelectedIndex=0
    let q5Score=[6,4,3,5,2]
    
    let q6Answer=["打扮的華麗以引人注目","周圍找有沒有認識的人","盡量不讓別人注目，安靜地入場"]
    @State var q6SelectedIndex=0
    let q6Score=[6,4,2]
    
    let q7Answer=["認爲是一個休息的好機會","感到非常煩躁","於a、b兩者之間"]
    @State var q7SelectedIndex=0
    let q7Score=[6,2,4]
    
    @State var q8SelectedColor=Color.black
    @State var q8Score=7
    
    let q9Answer=["躺平","身體傾側向一面","身體捲起","把自己的手當枕頭","用被子蓋過頭"]
    @State var q9SelectedIndex=0
    let q9Score=[7,6,4,2,1]
    
    let q10Answer=["下墜","和別人爭吵","在尋找某東西或某人","飛","我不常做夢","我經常做好夢"]
    @State var q10SelectedIndex=0
    let q10Score=[4,2,3,5,6,1]
    
    @State var showResult=false
    
    @State var resultText=""
    

    
    @State private var drawHexNumber: String = "#000000"
    
    func getColorsFromPicker(pickerColor: Color) {
            let colorString = "\(pickerColor)"
            let colorArray: [String] = colorString.components(separatedBy: " ")

            if colorArray.count > 1 {
                var r: CGFloat = CGFloat((Float(colorArray[1]) ?? 1))
                var g: CGFloat = CGFloat((Float(colorArray[2]) ?? 1))
                var b: CGFloat = CGFloat((Float(colorArray[3]) ?? 1))
                //let alpha: CGFloat = CGFloat((Float(colorArray[4]) ?? 1))

                if (r < 0.0) {r = 0.0}
                if (g < 0.0) {g = 0.0}
                if (b < 0.0) {b = 0.0}

                if (r > 1.0) {r = 1.0}
                if (g > 1.0) {g = 1.0}
                if (b > 1.0) {b = 1.0}
            
                if(r < 20.0/255 && g < 20.0/255 && b < 20.0/255){ //black
                    q8Score=7
                }else if(r > 200.0/255 && g < 150.0/255 && b <= 70.0/255){
                    q8Score=6  //red
                }else if(r > 200.0/255 && g >= 150.0/255 && b <= 70.0/255){
                    q8Score=5  //yellow
                }else if(r < 100.0/255 && g >= 150.0/255 && b <= 100.0/255){
                    q8Score=4  //green
                }else if(r < 180.0/255 && g < 140.0/255 && b <= 180.0/255){
                    q8Score=3   //blue
                }else if(r > 235.0/255 && g > 235.0/255 && b > 235.0/255){
                    q8Score=2  //white
                }else{
                    q8Score=1
                }

                // Update hex
                let rgb:Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0
                drawHexNumber = String(format: "#%06X", rgb)
            }
    }

    func calculateScore()->Int{
        var score=0
        score+=q1Score[q1SelectedIndex]
        score+=q2Score[q2SelectedIndex]
        score+=q3Score[q3SelectedIndex]
        score+=q4Score[q4SelectedIndex]
        score+=q5Score[q5SelectedIndex]
        score+=q6Score[q6SelectedIndex]
        score+=q7Score[q7SelectedIndex]
        score+=q9Score[q9SelectedIndex]
        score+=q10Score[q10SelectedIndex]
        score+=q8Score
        
        return score
    }
    
    func getResultString(score:Int)->String{
        if(score>60){
            return "你在別人眼中是一個以利益為先的人。你有虛榮之心，亦較自我中心，同時亦喜歡支配別人。雖然有人會羨慕及仰望你，但其實你的信賴度很低，真正相信你的人亦不多。"
        }
        
        if(score>50){
            return "你在別人眼中是領導者，亦是一個能在短時間內做出決定的人。你亦是一個很容易興奮，而且情緒起伏很大，十分衝動的人。另外，你果敢、喜歡接受挑戰，只要有機會，你都會接受新嘗試。和你親近的人，會被你的熱情吸引。"
        }
        
        if(score>40){
            return "你身邊的人都認為你活潑、有魅力、有趣和開朗。無論去到哪裡，你也受到注目，但你很會看別人的眼色，所以不會變得驕傲自大。另外，你在別人眼中亦是一個多情和親切的人，在別人有困難時、第一時間都會想起你，因為你擁有樂於助人的形象。"
        }
        
        if(score>30){
            return "別人眼中的你、是一個賢明、慎重、小心、現實的人，而且十分聰明，又很高的能力和才能，為人亦謙虛。另外，你和別人交往時，不會以輕佻態度接近，而對認識的朋友十分真誠，希望別人亦能以相同的態度待你。"
        }
        
        if(score>20){
            return "在別人眼中，你是一個固執和非常小心的人。無論什麼事，你也會慎重和非常小心。一旦遇上令你著迷的事，你會非常衝動地朝著目標前進。不過，因為做事實在太仔細，有時候會給人「太執著」、「太認真」的感覺，在適當時候記得要顧及別人的感受！"
        }
        
        return "在別人眼中的你、是十分害羞、膽小、柔弱的人。你亦是有「選擇困難」的人，無論什麼事情，都要別人替你決定，而別人也盡量不想與你有牽連。另一方面，你的觀察力很高，經常發現到一些別人沒有發現的錯處和問題，所以和你不熟的人會以為你很高智慧，但和你親近的人就會知道這不是事實。"
    }
    
    var body: some View {
        Form {
            Group {
                Section {
                    Text("1.你心情最好的時候是？")
                    Picker(selection: $q1SelectedIndex) {
                        ForEach(q1Answer.indices){
                            item in
                            Text(q1Answer[item])
                        }
                    } label: {
                        Text("choose")
                    }.pickerStyle(.segmented)
                }
                
                Section {
                    Text("2.走路的時候，你是？")
                    Picker(selection: $q2SelectedIndex) {
                        ForEach(q2Answer.indices){
                            item in
                            Text(q2Answer[item])
                        }
                    } label: {
                        Text("choose")
                    }
                }
                
                Section {
                    Text("3.和別人說話的時候，你會？")
                    Picker(selection: $q3SelectedIndex) {
                        ForEach(q3Answer.indices){
                            item in
                            Text(q3Answer[item])
                        }
                    } label: {
                        Text("choose")
                    }.pickerStyle(.menu)
                }
                
                Section {
                    Text("4.休息的時候，你會？")
                    Picker(selection: $q4SelectedIndex) {
                        ForEach(q4Answer.indices){
                            item in
                            Text(q4Answer[item])
                        }
                    } label: {
                        Text("choose")
                    }.pickerStyle(.menu)
                }
                
                Section {
                    Text("5.遇到很有趣的事情時，你會？")
                    Picker(selection: $q5SelectedIndex) {
                        ForEach(q5Answer.indices){
                            item in
                            Text(q5Answer[item])
                        }
                    } label: {
                        Text("choose")
                    }.pickerStyle(.menu)
                }
            }
            
            
            
            Section {
                Text("6.去派對或者人多的場合時，你會？")
                Picker(selection: $q6SelectedIndex) {
                    ForEach(q6Answer.indices){
                        item in
                        Text(q6Answer[item])
                    }
                } label: {
                    Text("choose")
                }.pickerStyle(.menu)
            }
            
            Section {
                Text("7.集中於一件事但突然被阻礙時，你會？")
                Picker(selection: $q7SelectedIndex) {
                    ForEach(q7Answer.indices){
                        item in
                        Text(q7Answer[item])
                    }
                } label: {
                    Text("choose")
                }.pickerStyle(.menu)
            }
            
            Section {
                Text("8.你最喜歡的顏色是？")
                ColorPicker("選擇顏色", selection: $q8SelectedColor,supportsOpacity: false).onChange(of: q8SelectedColor) { newValue in
                    getColorsFromPicker(pickerColor: newValue)
                }

            }
            
            Section {
                Text("9.睡覺時，你的姿勢是？")
                Picker(selection: $q9SelectedIndex) {
                    ForEach(q9Answer.indices){
                        item in
                        Text(q9Answer[item])
                    }
                } label: {
                    Text("choose")
                }.pickerStyle(.menu)
            }

            Section {
                Text("10.你經常做哪種夢？")
                Picker(selection: $q10SelectedIndex) {
                    ForEach(q10Answer.indices){
                        item in
                        Text(q10Answer[item])
                    }
                } label: {
                    Text("choose")
                }.pickerStyle(.menu)
            }
            
            Button {
                resultText = "你的得分:\(calculateScore()) \n\n  "+getResultString(score: calculateScore())
                showResult=true
            } label: {
                Text("查看結果").font(.title2)
            }.sheet(isPresented: $showResult) {
                TestResultView(showString: $resultText,showResult: $showResult)
            }


            
            

        }.navigationTitle("你在別人眼中是怎樣的人？")
    }
}

struct testA_Previews: PreviewProvider {
    static var previews: some View {
        testAView()
    }
}
