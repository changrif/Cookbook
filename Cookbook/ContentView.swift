//
//  ContentView.swift
//  Cookbook
//
//  Created by Chandler Griffin on 9/16/24.
//

import SwiftUI

struct ContentView: View {
    typealias Localization = LocalizedContent.ContentView
    
    var body: some View {
        NavigationView {
            MealList(viewModel: .init(.dessert))
            Text(Localization.chooseARecipe)
                .font(.largeTitle)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
