//
//  SearchView.swift
//  festivalSeoul
//
//  Created by 권순형 on 2023/04/03.
//

import SwiftUI

struct SearchView: View {
    
    /// ------------Text Field 관련------------
    /// 검색창에 입력되는 텍스트
    @State var text: String = ""
    /// 검색창 Focus / Focus 해제 여부
    @State private var isEditing = false
    
    /// ------------카테고리 관련------------
    /// 카테고리 메뉴
    let categoryMenus: [String] = ["전체","클래식", "콘서트", "연극", "국악", "뮤지컬/오페라", "축제-문화/예술", "무용", "교육/체험"]
    /// 카테고리 초기값
    @State private var selectedCategory: String = "카테고리"
    /// 카테고리 목록 show / hide
    @State var isExpanded = false
    
    var body: some View {
        /// Desc : Collection View Cell (SearchCollectionViewCell) 탭하면 해당 공연 Detail View (SearchDetailView)로 이동
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
                    GroupBox {
                        DisclosureGroup(
                            "\(selectedCategory)",
                            isExpanded: $isExpanded) {
                                ForEach(0..<categoryMenus.count){index in
                                    Text(categoryMenus[index])
                                        .onTapGesture {
                                            // 카테고리 선택
                                            selectedCategory = categoryMenus[index]
                                            print(selectedCategory)
                                            // 카테고리 선택하면 dropdown menu 접힘
                                            isExpanded.toggle()
                                        }
                                    Divider()
                                }
                            }
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
                                if selectedCategory == "카테고리" || selectedCategory == "전체" {
                                    SearchCollectionViewCell(row: i, column: j, category: "")
                                }else{
                                    /// Desc : 카테고리를 선택 (변경)했을 경우 ScrollView를 재호출하기 위해 view의 identity를 갱신해준다.
                                    /// Date : 2023.04.22
                                    /// Author : youngjin
                                    SearchCollectionViewCell(row: i, column: j, category: selectedCategory).id(UUID())
                                }
                            }
                        }
                    }
                }
                // Scroll 아래로 당겨서 새로고침
                .refreshable {
                    print("refresh")
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
