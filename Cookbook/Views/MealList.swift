//
//  MealList.swift
//  Cookbook
//
//  Created by Chandler Griffin on 9/18/24.
//

import SwiftUI

struct MealList: View {
    
    enum LoadingState {
        case loading
        case complete([MealListItem])
        case error
    }
    
    @State private var state: LoadingState = .loading
        
    var body: some View {
        Group {
            switch state {
            case .loading:
                ProgressView()
            case .error:
                Text("Something went wrong.")
            case .complete(let items):
                Content(items: items)
            }
        }
        .padding()
    }
    
    struct Content: View {
        let items: [MealListItem]
        
        var body: some View {
            List {
                ForEach(items) { item in
                    NavigationLink {
                        MealDetail(id: item.id)
                    } label: {
                        Text(item.name)
                    }
                }
            }
            .navigationTitle("Desserts")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

struct MealList_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MealList.Content(items: .preview)
                .padding()
        }
    }
}
