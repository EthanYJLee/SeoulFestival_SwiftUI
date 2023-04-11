//
//  SearchView.swift
//  festivalSeoul
//
//  Created by 권순형 on 2023/04/03.
//

import SwiftUI

struct SearchView: View {
    /// 검색창에 입력되는 텍스트
    @State var text: String = ""
    /// 검색창 Focus / Focus 해제 여부
    @State private var isEditing = false
    
    var body: some View {
        /// Desc : Collection View Cell ( SearchCollectionViewCell) 탭하면 해당 공연 Detail View (SearchDetailView)로 이동
        /// Date : 2023.04.11
        /// Author : youngjin
        NavigationView{
            VStack{
                /// Desc : 검색어 입력창
                /// Date : 2023.04.05
                /// Author : youngjin
                HStack{
                    TextField("Search...",text: $text)
                        .padding(8)
                        .padding(.horizontal,25)
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                        .overlay(
                            HStack{
                                Image(systemName: "magnifyingglass")
                                    .foregroundColor(.gray)
                                    .frame(minWidth: 0,maxWidth: .infinity,alignment: .leading)
                                    .padding(.leading,8)
                                // x 버튼 (현재 텍스트 지우기)
                                if isEditing{
                                    Button(
                                        action: {
                                            self.text = ""
                                        })
                                    {
                                        Image(systemName: "multiply.circle.fill").foregroundColor(.gray).padding(.trailing,8)
                                    }
                                }
                            }
                        )
                        .padding(.horizontal,10)
                        .onTapGesture {
                            self.isEditing = true
                        }
                    // 입력중이면 우측에 Cancel 버튼 나옴
                    if isEditing{
                        Button(action:{
                            self.isEditing = false
                            self.text = ""
                        }){
                            Text("Cancel")
                        }
                        .padding(.trailing, 25)
                        .transition(.move(edge: .trailing))
                        .animation(.default)}
                }
                Spacer()
                /// Desc : 카테고리 선택 버튼
                /// Date : 2023.04.05
                /// Author : youngjin
                HStack{
                    Button(action: {
                        print("Button1 Tapped")
                    }){
                        Text("전체")
                    }
                    Button(action: {
                        print("Button2 Tapped")
                    }){
                        Text("category2")
                    }
                    Button(action: {
                        print("Button3 Tapped")
                    }){
                        Text("category3")
                    }
                }
                .padding(10)
                
                /// Desc : Collection View Cell 생성
                /// Date : 2023.04.10
                /// Author : youngjin
                ScrollView(.vertical,showsIndicators: false){
                    ForEach(0..<SearchCollectionViewCell.row) { i in
                        HStack{
                            ForEach(0..<SearchCollectionViewCell.column) { j in
                                SearchCollectionViewCell(row: i, column: j)
                            }
                        }
                        
                    }
                }
            }
        }
    }
}


struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
