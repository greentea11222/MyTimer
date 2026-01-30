//
//  SettingView.swift
//  MyTimer
//
//  Created by USER on 2026/01/29.
//

import SwiftUI

struct SettingView: View {
    //秒数設定
    @AppStorage("timer_value") var timerValue = 10
    
    var body: some View {
        //奥から手前にレイアウト
        ZStack {
            //背景色表示
            Color("backgroundSetting")
            //セーフエリアを超えて画面全体に配置
                .ignoresSafeArea()
            
            //垂直にレイアウト
            VStack {
                //スペースを開ける
                Spacer()
                //テキストを表示する
                Text("\(timerValue)秒")
                //文字サイズを指定
                    .font(.largeTitle)
                //スペースを開ける
                Spacer()
                
                //Pickerを表示(selectionの値とtagが連動）
                Picker(selection: $timerValue) {
                    Text("10")
                        .tag(10)
                    Text("20")
                        .tag(20)
                    Text("30")
                        .tag(30)
                    Text("40")
                        .tag(40)
                    Text("50")
                        .tag(50)
                    Text("60")
                        .tag(60)
                } label: {
                    Text("選択")
                }//Pickerここまで
                //Pickerをホイール表示
                .pickerStyle(.wheel)
                //スペースを開ける
                Spacer()
            } //VStackここまで
        } //ZStackここまで
    }
}

#Preview {
    SettingView()
}
