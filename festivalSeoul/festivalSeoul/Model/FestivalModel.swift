//
//  FestivalModel.swift
//  festivalSeoul
//
//  Created by 이영진 on 2023/04/05.
//

import Foundation

struct CulturalEventInfo: Codable{ // 디코딩 가능한 상태로 변경
    /// Desc : 딕셔너리 형태는 struct, 배열 형태는 [] (리스트)
    /// Date : 2023.04.06
    /// Author : youngjin
    var culturalEventInfo: EventInfo
    
    /// Desc : property 이름 match시켜주기
    /// Date : 2023.04.05
    /// Author : youngjin
    enum CodingKeys: String, CodingKey{
        case culturalEventInfo = "culturalEventInfo"
    }
    
    /// Desc : 초기화에 사용되는 sample data
    /// Date : 2023.04.07
    /// Author : youngjin
    static let sampleData = CulturalEventInfo(
        culturalEventInfo: EventInfo(
            totalCounts: 0,
            result: Result(
                code: "",
                message: ""),
            row: [Row(
                    codename: "",
                    title: "",
                    date: "",
                    guname: "",
                    image: ""
                    )
                ]
        )
    )
    
}
struct EventInfo: Codable{
    /// Desc : 자료의 전체 개수
    var totalCounts:Int
    /// Desc : 요청결과 코드, 메세지
    var result:Result
    /// Desc : 이벤트 정보
    var row: [Row]
    
    enum CodingKeys: String, CodingKey{
        case totalCounts = "list_total_count"
        case result = "RESULT"
        case row = "row"
    }
}

struct Result: Codable{
    var code: String
    var message: String
    
    enum CodingKeys: String, CodingKey{
        case code = "CODE"
        case message = "MESSAGE"
    }
}

struct Row: Codable{
    /// 카테고리
    var codename:String
    /// 공연/행사 이름
    var title:String
    /// 날짜
    var date:String
    /// 자치구
    var guname: String
    /// 이미지
    var image: String
    
    enum CodingKeys: String, CodingKey{
        case codename = "CODENAME"
        case title = "TITLE"
        case date = "DATE"
        case guname = "GUNAME"
        case image = "MAIN_IMG"
    }
}
