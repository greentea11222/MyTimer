//
//  ContentView.swift
//  MyTimer
//
//  Created by USER on 2026/01/29.
//

import SwiftUI

struct ContentView: View {
    //タイマーの変数を作成
    @State var timerHandler : Timer?
    //カウント（経過時間）の変数を作成
    @State var count = 0
    //永続化(データを保存して復元できる）する秒数設定（初期値は10）
    @AppStorage("timer_value") var timerValue = 10

    
    var body: some View {
        NavigationStack {
            //奥から手前にレイアウト
            ZStack {
                //背景画像
                Image("backgroundTimer")
                //リサイズ
                    .resizable()
                //セーフエリアを超えて画面全体に配置
                    .ignoresSafeArea()
                //アスペクト比を維持して短辺基準に収める
                    .scaledToFill()
            
                //垂直にレイアウト（View間の間隔は30）
                VStack(spacing: 30.0) {
                    //テキストを表示する
                    Text("残り\(timerValue - count)秒")
                    //文字のサイズを指定
                        .font(.largeTitle)
                    //水平にレイアウト
                    HStack {
                        //スタートボタン
                        Button {
                            //ボタンをタップした時のアクション
                            //タイマーのカウントダウンを開始する関数
                            startTimer()
                        } label: {
                            Text("スタート")
                            //文字サイズを指定
                                .font(.title)
                            //文字色を白に指定
                                .foregroundColor(Color.white)
                            //幅の高さを140に指定
                                .frame(width: 140, height: 140)
                            //背景を指定
                                .background(Color("startColor"))
                            //円形に切り抜く
                                .clipShape(Circle())
                        } //スタートボタンここまで
                        
                        //ストップボタン
                        Button {
                            //ボタンをタップした時のアクション
                            //timerHandlerをアンラップしてunwrappedTimerHandlerに代入
                            if let unwrappedTimerHandler = timerHandler {
                                //もしタイマーが実行中だったら停止
                                if unwrappedTimerHandler.isValid == true {
                                    //タイマー停止
                                    unwrappedTimerHandler.invalidate()
                                }
                            }
                        } label: {
                            Text("ストップ")
                            //文字サイズを指定
                                .font(.title)
                            //文字色を白に指定
                                .foregroundColor(Color.white)
                            //幅の高さを140に指定
                                .frame(width: 140, height: 140)
                            //背景を指定
                                .background(Color("stopColor"))
                            //円形に切り抜く
                                .clipShape(Circle())
                        } //ストップボタン
                        
                    } //HStackここまで
                } //VStackここまで
            } //ZStackここまで
            //画面が表示される時（起動時や、秒数設定画面から戻ってきたとき）に実行
            .onAppear {
                //カウント（経過時間）の変数を初期化
                count = 0
            } //.onAppearここまで
            
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
    
    //1秒ごとに実行されてカウントダウン
    func countDownTimer() {
        //count（経過時間）のインクリメント
        count += 1
        
        //残り時間が0以下のときタイマーを止める
        if timerValue - count <= 0 {
            //タイマー停止
            timerHandler?.invalidate()
        }
    } //countDownTimer()ここまで
    
    //タイマーのカウントダウンを開始する
    func startTimer() {
        //timerHandlerをアンラップしてunwrappedTimerHandlerに代入
        if let unwrappedTimerHandler = timerHandler {
            //もしタイマーが実行中ならスタートしない
            if unwrappedTimerHandler.isValid == true {
                //何も処理しない
                return
            }
        }
        
        //残り時間が0以下のとき、count（経過時間）を0に初期化する
        if timerValue - count <= 0 {
            //count（経過時間）を0に初期化する
            count = 0
        }
        
        //タイマーをスタート
        timerHandler = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            //タイマー実行時に、1秒に1回呼び出される
            //1秒毎に実行されてカウントダウンする関数を実行
            countDownTimer()
        }
    } //startTimer()ここまで
    
} //ContentViewここまで

#Preview {
    ContentView()
}
