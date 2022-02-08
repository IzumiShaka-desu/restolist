//
//  RestoListProvider.swift
//  restolist
//
//  Created by Akashaka on 08/02/22.
//
import Foundation
import Combine
import Alamofire
class RestoListDataProvider {
    func fetchItems( completion: @escaping (RestoList?) -> Void) ->Void {
        let urlString =  "https://restaurant-api.dicoding.dev/list"
        AF.request(urlString,method: .get).responseDecodable(of:RestoList.self){response in
            completion(response.value )
        }
    }
}
