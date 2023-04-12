//
//  SearchDetailView.swift
//  festivalSeoul
//
//  Created by 이영진 on 2023/04/05.
//

import SwiftUI

struct SearchDetailView: View{
    @State private var isBtnTapped = false
    @GestureState private var dragOffset: CGFloat = 0
    
    var codename: String
    var title: String
    var date: String
    var guname: String
    var image: String
    var link: String
    
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    
    
    var body: some View{
        
        ZStack{
            if !self.isBtnTapped{
                VStack(alignment: .leading){
                    Text("공연 정보")
                        .font(.system(.largeTitle, design: .rounded))
                        .fontWeight(.black)
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
                .frame(width: self.isBtnTapped ? width:width/1.5, height: self.isBtnTapped ? height/1.5:height/2)
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
                InfoView(codename: codename, title: title, date: date, guname: guname, image: image, link: link)
                    .offset(y: 200)
                    .offset(x: self.dragOffset)
                    .transition(.move(edge: .bottom))
                    .animation(.interpolatingSpring(mass:0.5, stiffness: 100, damping: 10, initialVelocity:0.3))
                Button(action: {
                    self.isBtnTapped = false
                    
                }){
                    Image(systemName: "xmark.circle.fill")
                        .font(.system(size: 30))
                        .foregroundColor(.black)
                        .opacity(0.7)
                        .contentShape(Rectangle())
                }
            }
        }
        .background(Color("lightGray"))
        
    }
        
}

struct SearchDetailView_Previews: PreviewProvider {
    static var previews: some View {
        SearchDetailView(codename: "", title: "", date: "", guname: "", image: "", link: "")
    }
}

struct InfoView: View{
    var codename: String
    var title: String
    var date: String
    var guname: String
    var image: String
    var link: String
    
    var body: some View{
        ScrollView{
            ZStack{
                VStack(alignment: .leading, spacing: 5){
                    VStack(alignment: .leading, spacing: 5){
                        Text("\(self.title) (\(self.guname))")
                            .font(.title)
                        Text(self.date)
                            .font(.headline)
                        
                        Link("예매하기", destination: URL(string: link)!)
                            .font(.title3)
                    }
                    
                }
                .frame(width: UIScreen.main.bounds.width,height: UIScreen.main.bounds.height/1.8)
                .background(Color("lightGray"))
            }
        }
    }
}
