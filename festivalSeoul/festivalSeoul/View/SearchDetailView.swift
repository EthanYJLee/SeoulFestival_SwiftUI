//
//  SearchDetailView.swift
//  festivalSeoul
//
//  Created by 이영진 on 2023/04/05.
//

import SwiftUI

struct SearchDetailView: View{
    var codename: String
    var title: String
    var date: String
    var guname: String
    var image: String
    var link: String
    
    let width = UIScreen.main.bounds.width/1.5
    let height = UIScreen.main.bounds.height/2

    
    var body: some View{
        VStack{
            
            AsyncImage(url: URL(string: image)) { img in
                img.resizable()
            } placeholder: {
                ProgressView()
            }
            .frame(width: width, height: height)
            .padding(10)
            Text(title)
            Text(date)
            Link("예매하기", destination: URL(string: link)!)
                .font(.title)
                
        }
    }
}

struct SearchDetailView_Previews: PreviewProvider {
    static var previews: some View {
        SearchDetailView(codename: "", title: "", date: "", guname: "", image: "", link: "")
    }
}
