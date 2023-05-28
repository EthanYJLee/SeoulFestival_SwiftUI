//
//  ContentView.swift
//  festivalSeoul
//
//  Created by 권순형 on 2023/04/03.
//

import SwiftUI

// tab bar view 
struct ContentView: View {
    @State var isLoading: Bool = true
    var body: some View {
        ZStack {
            VStack {
                TabView {
                    MainView()
                        .tabItem {
                            Image(systemName: "house")
                            Text("홈")
                        }
                    MapView()
                        .tabItem {
                            Image(systemName: "map")
                            Text("지도")
                        }
                    
                    SearchView()
                        .tabItem {
                            Image(systemName: "magnifyingglass")
                            Text("검색")
                        }
                    
                    CalendarView()
                        .tabItem {
                            Image(systemName: "calendar")
                            Text("달력")
                        }
                }
            }
            .zIndex(0)
            // 로딩중이면 Circular Indicator 보여주기
            if isLoading{
                ProgressCircle().transition(.opacity).zIndex(1)
            }
            
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
                
                withAnimation{
                    isLoading.toggle()
                }
            })
        }
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
