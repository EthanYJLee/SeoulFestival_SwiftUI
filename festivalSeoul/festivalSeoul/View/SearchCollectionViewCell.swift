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
    let width = (UIScreen.main.bounds.width/2)-20
    var index = 0
    
    /// Desc : 공연 행사 정보 표시
    /// Date : 2023.04.10
    /// Author : youngjin
    @State private var events = [Row]()
    
    @State var title = ""   // 제목
    @State var codename = ""    // 카테고리
    
    init(row: Int, column: Int) {
        // Collection View Cell에 index 주기
        index = (row * 2) + column
    }
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 10)
                .frame(width: width,height: width)
                .foregroundColor(.gray)
            VStack(alignment: .center, spacing: 10){
                Text("\(index):\(codename)").font(.title3)
                    .foregroundColor(.white)
                Text("\(title)").font(.system(size: 16))
                    .foregroundColor(.white)
                    
            }
            
        }
        .onTapGesture {
            
            print(index)
            print(codename)
        }
        
        /// Desc : View Cell이 그려질 때 공연 정보를 불러옴
        /// Date : 2023.04.06
        /// Author : youngjin
        .task {
            await fetchData()
        }
    }
    
    func fetchData() async{
        // Create URL
        let endpoint = Endpoint.worldwide
        let networkManager = NetworkManager()
        
        // Fetch Data
        do {
            let data = try await networkManager.download(from: .worldwide)
            // Decode Data
            if let result = try? JSONDecoder().decode(CulturalEventInfo.self, from: data){
                events = result.culturalEventInfo.row
                // 공연, 행사 제목 업데이트
                title = events[index].title
                codename = events[index].codename
            }
        }
        // Error
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
        SearchCollectionViewCell(row: 0, column: 1)
    }
}
