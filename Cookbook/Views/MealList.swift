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
                Text(LocalizedContent.Common.somethingWentWrong)
            case .complete(let items):
                Content(
                    category: viewModel.category.name,
                    items: items
                )
            }
        }
        .task {
            await viewModel.load()
        }
    }
    
    struct Content: View {
        let category: String
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
            .navigationTitle(category)
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

struct MealList_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MealList.Content(
                category: "Dessert",
                items: .preview
            )
            .padding()
        }
    }
}
