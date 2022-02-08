//
//  RestoDetailProvider.swift
//  restolist
//
//  Created by Akashaka on 08/02/22.
//

import Foundation
import Combine
import Alamofire
class RestoDetailDataProvider {
    func fetchItem(_ idRestaurant:String ,completion: @escaping (DetailRestaurantResponse?) -> Void) ->Void {
        let urlString =  "https://restaurant-api.dicoding.dev/detail/\(idRestaurant)"
        AF.request(urlString,method: .get).responseDecodable(of:DetailRestaurantResponse.self){response in
            completion(response.value)
        }
    }
}
