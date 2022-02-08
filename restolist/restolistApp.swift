//
//  restolistApp.swift
//  restolist
//
//  Created by Akashaka on 07/02/22.
//

import SwiftUI

@main
struct restolistApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(restoListController: RestoListController())
        }
    }
}
