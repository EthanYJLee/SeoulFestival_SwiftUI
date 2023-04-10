//
//  Endpoint.swift
//  festivalSeoul
//
//  Created by 이영진 on 2023/04/05.
//

import Foundation
// URL 설정
struct Endpoint{
    let path: String
    var queries: [URLQueryItem] = []
}

extension Endpoint{
    /// Desc : URL 생성
    /// 초기 설정 필요: info.plist or custom iOS target properties -> app transport security settings 추가 -> allow arbitrary loads -> YES
    var url: URL {
        var components = URLComponents()
        components.scheme = "http"
        components.host = "openapi.seoul.go.kr"
        components.port = 8088
        components.path = "/" + path
        
        
        guard let url = components.url else {
            preconditionFailure("Invalid URL components: \(components)")
        }
        
        return url
    }
}
extension Endpoint {
    static var worldwide: Self {
        Endpoint(
            path: "667a4643456c796a33315273504f79/json/culturalEventInfo/1/20/"
            
        )
    }
}
