//
//  ContentView.swift
//  MyTimer
//
//  Created by USER on 2026/01/29.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Text("タイマー画面")
            }
            //ナビゲーションにボタンを追加
            .toolbar {
                //ナビゲーションバーの右にボタンを追加
                ToolbarItem(placement: .topBarTrailing) {
                    //ナビゲーション遷移
                    NavigationLink {
                        //遷移先（設定画面）
                        SettingView()
                    } label : {
                        //テキストを表示
                        Text("秒数設定")
                    } //NavigationLinkここまで
                } //ToolbarItemここまで
            } // .toolbarここまで
        } //NavigationStackここまで
    } //bodyここまで
} //ContentViewここまで

#Preview {
    ContentView()
}
