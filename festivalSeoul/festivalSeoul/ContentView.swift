//
//  ContentView.swift
//  festivalSeoul
//
//  Created by 권순형 on 2023/04/03.
//

import SwiftUI

// tab bar view 
struct ContentView: View {
    var body: some View {
        NavigationView{
            VStack {
                NavigationLink(destination: MainView()) {
                    Text("홈페이지")
                }
                .padding()
                
                NavigationLink(destination: MapView()) {
                    Text("문화 행사 지도")
                }
                .padding()
                
                NavigationLink(destination: SearchView()) {
                    Text("검색 기능 탑재한 리스트 뷰")
                }
                .padding()
                
                NavigationLink(destination: CalendarView()) {
                    Text("달력으로 즐겨찾기 행사 보기")
                }
                .padding()
                
                
                
            }
            
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
