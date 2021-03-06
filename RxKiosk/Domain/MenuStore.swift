//
//  MenuStore.swift
//  RxKiosk
//
//  Created by WG Yang on 2022/06/20.
//

import Foundation
import RxSwift

protocol MenuFetchable {
    func fetchMenus() -> Observable<[MenuItem]>
}

class MenuStore: MenuFetchable {
    func fetchMenus() -> Observable<[MenuItem]> {
        struct Response: Decodable {
            let menus: [MenuItem]
        }
        
        return APIService.fetchAllMenusRx()
            .map {
                data in
                guard let response = try? JSONDecoder().decode(Response.self, from: data) else {
                    throw NSError(domain: "Decoding error", code: -1)
                }
                return response.menus
            }
    }
}
