//
//  SwiftUIGameOfLifeApp.swift
//  FinalProject
//

import Foundation
import SwiftUI
import ComposableArchitecture

@main
struct SwiftUIGameOfLife: App {
    init() {
//        UINavigationBar.appearance().titleTextAttributes = [
//            .foregroundColor: UIColor.black
//        ]
        UINavigationBar.appearance().largeTitleTextAttributes = [
            .foregroundColor: UIColor(Color("accent"))
        ]
//        UINavigationBar.appearance().tintColor = UIColor(named: "pastel")
//        UINavigationBar.appearance().barTintColor = UIColor(named: "pastel")

//        UITableViewCell.appearance().backgroundColor = .clear
//        UITableView.appearance().backgroundColor = .clear
//        UITableView.appearance().tableFooterView = UIView()
    }
    
    let store = Store(
        initialState: AppState(),
        reducer: appReducer,
        environment: AppEnvironment()
    )
    var body: some Scene {
        WindowGroup {
            ContentView(store: store)
        }
    }
}
