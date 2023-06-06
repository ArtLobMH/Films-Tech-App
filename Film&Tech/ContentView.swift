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
                    Image("cart")
                    Text("Category")
                }
            CompareView()
                .tabItem{
                    Image("compare")
                    Text("Compare")
                }
        }
    }
}

struct FilmsView: View {
    var body: some View {
        ZStack {
            Color.gray
            ScrollView{
                VStack {
                    ForEach(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in
                        FilmCard()
                    }
                }
            }
        }
    }
}

struct FilmCard: View {
    var body: some View {
        Rectangle()
            .frame(height : 250)
            .background(Color.black)
        .padding(.bottom, 20)
    }
}

struct CategoryView: View {
    var body: some View {
        Text("Category")
    }
}

struct CompareView: View {
    var body: some View {
        Text("Compare")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
