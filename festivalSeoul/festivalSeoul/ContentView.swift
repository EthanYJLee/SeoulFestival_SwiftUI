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
        VStack {
            TabView {
                  MainView()
                    .tabItem {
                      Image(systemName: "1.square.fill")
                      Text("홈페이지")
                    }
                 MapView()
                    .tabItem {
                      Image(systemName: "2.square.fill")
                      Text("지도")
                    }
                  
                SearchView(text: .constant(""))
                    .tabItem {
                      Image(systemName: "3.square.fill")
                      Text("검색")
                    }
                
                CalendarView()
                    .tabItem {
                      Image(systemName: "4.square.fill")
                      Text("달력")
                    }
                }
        }
            
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
