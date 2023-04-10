//
//  NetworkManager.swift
//  festivalSeoul
//
//  Created by 이영진 on 2023/04/05.
//

import Foundation

class NetworkManager {
    /// Desc : URLSession property를 정의하고 initializer를 통해 URLSession의 singleton 인스턴스인 .shared를 기본값으로 할당
    /// Date : 2023.04.05
    /// Author : youngjin
    let session: URLSession
    init(session: URLSession = .shared) {
        self.session = session // <- initializer에 parameter로 주입되는 session
    }
    /// Desc : 데이터 다운로드하는 method
    /// Date : 2023.04.05
    /// Author : youngjin
    func download(from endpoint: Endpoint) async throws -> Data {
        let (data, _) = try await session.data(from: endpoint.url)
        return data
    }
}
