////
////  FestivalViewModel.swift
////  festivalSeoul
////
////  Created by 이영진 on 2023/04/21.
////
//
//import SwiftUI
//
//class FestivalViewModel: ObservableObject {
//
//    init() {
//        getFestival()
//    }
//
//    func getFestival() {
//        // url은 옵셔널이므로 guard let 사용
//        guard let url = URL(string: "http://openapi.seoul.go.kr:8088/667a4643456c796a33315273504f79/json/culturalEventInfo/1/1/") else { return }
//
//        URLSession.shared.dataTask(with: url) { data, response, error in
//
//            //1. 데이터 확인
//            guard let data = data else {
//                print("데이터가 존재하지 않습니다.")
//                return
//            }
//
//            //2. 오류 확인
//            guard error == nil else {
//                print("오류 : \(String(describing: error))")
//                return
//            }
//
//            //3. http응답을 받음
//            guard let response = response as? HTTPURLResponse else {
//                print("잘못된 응답입니다.")
//                return
//            }
//
//            //4. 응답 상태
//            //Successful response = 200 ~ 299
//            guard response.statusCode >= 200 && response.statusCode < 300 else {
//                print("Status Code는 2xx이 되야 합니다. 현재 Status Code는 \(response.statusCode) 입니다.")
//                return
//            }
//            print("데이터를 성공적으로 다운로드 했습니다!")
//            print(data)
//            //data를 문자열로 변환해줘야 합니다.
//            let jsonString = String(data: data, encoding: .utf8)
//            print(jsonString)
//        }
//        .resume()
//    }
//}
//struct FestivalView: View {
//    @StateObject var vm = FestivalViewModel()
//    var body: some View {
//        Text("Hello, World!")
//
//    }
//}
