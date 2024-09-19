//
//  ContentView.swift
//  Cookbook
//
//  Created by Chandler Griffin on 9/16/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            MealList()
            Text("Choose a recipe")
                .font(.largeTitle)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
