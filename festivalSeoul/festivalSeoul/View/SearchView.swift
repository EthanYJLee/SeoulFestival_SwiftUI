//
//  SearchView.swift
//  festivalSeoul
//
//  Created by 권순형 on 2023/04/03.
//

import SwiftUI

struct SearchView: View {
    /// 검색창에 입력되는 텍스트
    @Binding var text: String
    /// 검색창 선택/선택해제 여부
    @State private var isEditing = false
    
    var body: some View {
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
                if isEditing{
                    Button(action:{
                        self.isEditing = false
                        self.text = ""
                    })
                    
                    {
                        Text("Cancel")
                    }
                    .padding(.trailing, 25)
                    .transition(.move(edge: .trailing))
                    .animation(.default)
                }
                
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
            /// Desc : Collection View Cell에 값 전달
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

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(text: .constant(""))
    }
}

///// SearchCollectionView
//struct SearchCollectionView: UIViewRepresentable{
////    @State var data = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14]
//    @Binding var festival: Array<String>
//    @Binding var selection: Bool?
//    @Binding var itemIndex: Int?
//    func makeUIView(context: Context) -> UICollectionView {
//        let collectionView = UICollectionView(frame:.zero, collectionViewLayout: UICollectionViewFlowLayout())
//
//        collectionView.backgroundColor = .gray
//        collectionView.dataSource = context.coordinator
//        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
//
//        return collectionView
//    }
//
//
//    func updateUIView(_ uiView: UICollectionView, context: Context) {
//
//    }
//
//    func makeCoordinator() -> Coordinator {
//        Coordinator(self)
//    }
//}
//
///// Desc : DataSource, Delegate 구현
///// Date : 2023.04.05
///// Author : youngjin
//class Coordinator: NSObject, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
//    private let parent: SearchCollectionView
//
//    init(_ collectionView: SearchCollectionView) {
//        self.parent = collectionView
//    }
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        self.parent.festival.count
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
//        cell.backgroundColor = .lightGray
//        cell.sizeToFit()
//        return cell
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//
//        return CGSize(width: 100, height: 100)
//    }
//
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        parent.itemIndex = indexPath.item
//        parent.selection = true
//    }
//
//}
