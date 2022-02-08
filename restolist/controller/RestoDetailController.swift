//
//  RestoDetailController.swift
//  restolist
//
//  Created by Akashaka on 08/02/22.
//
import Combine
class RestoDetailController: ObservableObject {
    @Published var data: DetailRestaurantResponse? = nil
    let dataProvider: RestoDetailDataProvider = RestoDetailDataProvider()
    
    func fetchItem(_ idRestaurant:String) {
        dataProvider.fetchItem(idRestaurant){result in
            self.data=result
        }
    }
}
