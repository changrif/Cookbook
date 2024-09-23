//
//  MealDetail.swift
//  Cookbook
//
//  Created by Chandler Griffin on 9/18/24.
//

import SwiftUI

struct MealDetail: View {
    @StateObject var viewModel: MealDetailViewModel
        
    var body: some View {
        ZStack {
            switch viewModel.state {
            case .loading:
                ProgressView()
            case .error:
                Text("Something went wrong.")
            case .complete(let meal):
                Content(meal: meal)
            }
        }
        .task {
            await viewModel.load()
        }
    }
    
    struct Content: View {
        let meal: Meal
        
        var body: some View {
            ScrollView {
                VStack(alignment: .leading, spacing: 50) {
                    instructions
                    ingredients
                }
                .padding()
            }
            .navigationTitle(meal.name)
            .navigationBarTitleDisplayMode(.inline)
        }
        
        @ViewBuilder
        var instructions: some View {
            Text(meal.instructions)
                .font(.body)
                .lineSpacing(10)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        
        @ViewBuilder
        var ingredients: some View {
            if !meal.ingredients.isEmpty {
                VStack(alignment: .leading, spacing: 20) {
                    Text("Ingredients")
                        .font(.title)
                    
                    VStack(alignment: .leading) {
                        ForEach(meal.ingredients) { ingredient in
                            HStack {
                                Text(ingredient.name)
                                Spacer()
                                Text(ingredient.measure)
                            }
                            
                            if meal.ingredients.last?.id != ingredient.id {
                                Divider()
                            }
                        }
                    }
                }
            }
        }
    }
}

struct MealDetail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MealDetail.Content(meal: .preview)
                .padding()
        }
        .navigationViewStyle(.stack)
    }
}
