//
//  ContentView.swift
//  Film&Tech
//
//  Created by Макбук on 05.06.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            FilmsView()
                .tabItem{
                    Image("list")
                    Text("Top Films")
                }
            CategoryView()
                .tabItem{
                    Image("compare")
                    Text("Category")
                }
            MarketView()
                .tabItem{
                    Image("cart")
                    Text("Market")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
