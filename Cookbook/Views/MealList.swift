//
//  MealList.swift
//  Cookbook
//
//  Created by Chandler Griffin on 9/18/24.
//

import SwiftUI

struct MealList: View {
    @StateObject var viewModel: MealListViewModel
    
    var body: some View {
        ZStack {
            switch viewModel.state {
            case .loading:
                ProgressView()
            case .error:
                Text("Something went wrong.")
            case .complete(let items):
                Content(items: items)
            }
        }
        .task {
            await viewModel.load()
        }
    }
    
    struct Content: View {
        let items: [MealListItem]
        
        var body: some View {
            List {
                ForEach(items) { item in
                    NavigationLink {
                        MealDetail(viewModel: .init(item.id))
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
