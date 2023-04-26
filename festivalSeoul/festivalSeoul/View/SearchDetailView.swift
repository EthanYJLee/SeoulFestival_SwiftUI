//
//  SearchDetailView.swift
//  festivalSeoul
//
//  Created by 이영진 on 2023/04/05.
//

import SwiftUI
import EventKit

struct SearchDetailView: View{
    /// Desc : 상세보기 버튼 클릭 시 정보 Modal View 나오게
    /// Date : 2023.04.15
    /// Author : youngjin
    @State private var isBtnTapped = false
    /// Desc : 북마크 여부
    /// Date : 2023.04.15
    /// Author : youngjin
    @State private var isBookmarked = false
    @GestureState private var dragOffset: CGFloat = 0
    
    var codename: String
    var title: String
    var date: String
    var guname: String
    var place: String
    var image: String
    var link: String
    
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    
    var body: some View{
        ZStack{
            if !self.isBtnTapped{
                    VStack(alignment: .leading){
                        HStack {
                            Text("공연 정보")
                                .font(.system(.largeTitle, design: .rounded))
                            .fontWeight(.black)
                            if self.isBookmarked{
                                Image(systemName: "bookmark.fill")
                                    .font(.system(size: 25))
                                    .offset(x:-15,y: -5)
                            }
                        }
                        Text(title)
                            .font(.title2)
                    }
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
                    .padding(.leading, 20)
            }
            VStack{
                AsyncImage(url: URL(string: image)) { img in
                    img.resizable()
                } placeholder: {
                    ProgressView()
                }
                .clipShape(RoundedRectangle(cornerRadius: 30))
                .frame(width: width/1.4, height: height/2)
                .padding(.horizontal, self.isBtnTapped ? 0 : 20)
                
                Button(action: {
                    isBtnTapped = true
                }){
                    Text("상세보기")
                        .font(.system(.headline, design: .rounded))
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding(10)
                        .frame(minWidth: 0,maxWidth: UIScreen.main.bounds.width-30)
                        .background(Color(red:0.97, green: 0.369, blue: 0.212))
                        .cornerRadius(20)
                }
            }
            if self.isBtnTapped{
                
                VStack {
                    Button(action: {
                        self.isBtnTapped = false
                        
                    }){
                        Image(systemName: "xmark.circle.fill")
                            .font(.system(size: 30))
                            .foregroundColor(.black)
                            .opacity(0.7)
                            .contentShape(Rectangle())
                    }
                    InfoView(codename: codename, title: title, date: date, guname: guname, place: place, image: image, link: link)
                        .offset(y: 50)
                        .offset(x: self.dragOffset)
                        .transition(.move(edge: .bottom))
                    .animation(.interpolatingSpring(mass:0.5, stiffness: 100, damping: 10, initialVelocity:0.3))
                }
                
                
            }
        }
//        .background(Color("lightGray"))
        .background(Color(white: 0.9))
        
    }
    
}

struct SearchDetailView_Previews: PreviewProvider {
    static var previews: some View {
        SearchDetailView(codename: "", title: "", date: "", guname: "", place: "", image: "", link: "")
    }
}

struct InfoView: View{
    var codename: String
    var title: String
    var date: String
    var guname: String
    var place: String
    var image: String
    var link: String
    
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    
    @State private var showingAlert = false
    
    var body: some View{
        ScrollView{
            ZStack{

                    VStack(alignment: .center, spacing: 1){
                        HStack {
                            AsyncImage(url: URL(string: image)) { img in
                                img.resizable()
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(width: width/1.7,height: height/2.3)
                        .clipShape(RoundedRectangle(cornerRadius: 30))
                        }
                        Spacer()
                        Text("공연/행사명: \(self.title)")
                            .lineLimit(nil)
                        Text("장소: \(self.guname) - \(self.place)")
                            .lineLimit(nil)
                        Text(self.date)
                            .onTapGesture {
                                print("tapped")
                            }
                        Button(action: {
                                    self.showingAlert = true
                                }) {
                                    Text(self.date)
                                }
                                .alert(isPresented: $showingAlert) {
                                    Alert(title: Text("Title"), message: Text("This is a alert message"), dismissButton: .default(Text("Dismiss")))
                                }

                        
                        Link("홈페이지", destination: URL(string: link)!)
                            .font(.title3)
                        Spacer()
                    }
                .frame(width: UIScreen.main.bounds.width,height: UIScreen.main.bounds.height/1.5)
                .background(Color(white: 0.9))
            }
        }
    }
}

