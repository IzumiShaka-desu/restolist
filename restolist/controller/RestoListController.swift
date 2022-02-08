//
//  RestoListController.swift
//  restolist
//
//  Created by Akashaka on 08/02/22.
//
import Combine
class RestoListController: ObservableObject {
    @Published var data: RestoList? = nil
    let dataProvider: RestoListDataProvider = RestoListDataProvider()
    
    func fetchItems() {
        dataProvider.fetchItems{result in
            self.data=result
        }
    }
}
