//
//  BBNewsApp.swift
//  BBNews
//
//  Created by Berkant Beğdilili on 19.07.2020.
//

import SwiftUI

@main
struct BBNewsApp: App {
    
    @StateObject var news = NewsViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(news)
        }
    }
}
