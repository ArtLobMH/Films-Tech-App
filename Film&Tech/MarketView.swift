//
//  CompareView.swift
//  Film&Tech
//
//  Created by Макбук on 06.06.2023.
//

import SwiftUI

struct MarketView: View {
    var body: some View {
        NavigationView(){
            Text("Market")
                .navigationBarTitle("Market")
        }
    }
}

struct CompareView_Previews: PreviewProvider {
    static var previews: some View {
        MarketView()
    }
}
