//
//  SearchCollectionViewCell.swift
//  festivalSeoul
//
//  Created by 이영진 on 2023/04/07.
//

import SwiftUI

struct SearchCollectionViewCell: View {
    /// Desc : Collection View 열, 행 지정
    /// Date : 2023.04.10
    /// Author : youngjin
    static let column = 2
    static let row = 5
    var category = ""   // filtering할 특정 카테고리
    let width = (UIScreen.main.bounds.width/2)-20
    var index = 0
    
    /// Desc : 공연 행사 정보 표시
    /// Date : 2023.04.10
    /// Author : youngjin
    @State private var events = [Row]()
    @State var codename = ""    // 카테고리
    @State var title = ""   // 제목
    @State var date = ""    // 날짜
    @State var guname = ""  // 자치구
    @State var place = ""   // 장소
    @State var image = ""   // 이미지
    @State var link = ""   // 링크
    
    init(row: Int, column: Int, category: String) {
        // Collection View Cell에 index 주기
        index = (row * 2) + column
        self.category = category
    }
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 10)
                .frame(width: width,height: width)
                .foregroundColor(.gray)
            
            NavigationLink(destination: SearchDetailView(codename: codename, title: title, date: date, guname: guname, place: place, image: image, link: link)){
                VStack(alignment: .center, spacing: 10){
                    AsyncImage(url: URL(string: image)) { img in
                        img.resizable()
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: 50, height: 70)
                    .padding(10)
//                    Text("\(index):\(codename)").font(.title3)
//                        .foregroundColor(.white)
                    Text("\(title)").font(.system(size: 16))
                        .foregroundColor(.white)
                        .lineLimit(2)
                }
                .frame(width: width,height: width)
                .padding(5)
            }
        }
        
        /// Desc : View Cell이 그려질 때 공연 정보를 불러옴
        /// Date : 2023.04.06
        /// Author : youngjin
        .task {
            await fetchData()
        }
        
    }
        
    func fetchData() async{
        
        // 1. Create URL
        let endpoint = Endpoint(path: "667a4643456c796a33315273504f79/json/culturalEventInfo/1/20/", category: self.category)
        let networkManager = NetworkManager()
        
        // 2. Fetch Data
        do {
            let data = try await networkManager.download(from: endpoint)
            
            // 3. Decode Data
            if let result = try? JSONDecoder().decode(CulturalEventInfo.self, from: data){
                events = result.culturalEventInfo.row
                // 공연, 행사 제목 업데이트
                title = events[index].title
                codename = events[index].codename
                date = events[index].date
                guname = events[index].guname
                place = events[index].place
                image = events[index].image
                link = events[index].link
            }
        }
        
        // 4. Error
        catch let DecodingError.dataCorrupted(context) {
            print(context)
        } catch let DecodingError.keyNotFound(key, context) {
            print("Key '\(key)' not found:", context.debugDescription)
            print("codingPath:", context.codingPath)
        } catch let DecodingError.valueNotFound(value, context) {
            print("Value '\(value)' not found:", context.debugDescription)
            print("codingPath:", context.codingPath)
        } catch let DecodingError.typeMismatch(type, context)  {
            print("Type '\(type)' mismatch:", context.debugDescription)
            print("codingPath:", context.codingPath)
        } catch {
            print("error: ", error)
        }
    }
}

struct SearchCollectionViewCell_Previews: PreviewProvider {
    static var previews: some View {
        SearchCollectionViewCell(row: 0, column: 1, category: "")
    }
}

