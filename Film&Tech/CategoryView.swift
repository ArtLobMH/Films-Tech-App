//
//  CategoryView.swift
//  Film&Tech
//
//  Created by Макбук on 06.06.2023.
//

import SwiftUI

struct CategoryView: View {
    var body: some View {
        NavigationView(){
            Text("Category")
                .navigationBarTitle("Category")
        }
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView()
    }
}
