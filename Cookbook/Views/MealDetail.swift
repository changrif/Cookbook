//
//  MealDetail.swift
//  Cookbook
//
//  Created by Chandler Griffin on 9/18/24.
//

import SwiftUI

struct MealDetail: View {
    typealias Localization = LocalizedContent.MealDetail
    
    @StateObject var viewModel: MealDetailViewModel
        
    var body: some View {
        ZStack {
            switch viewModel.state {
            case .loading:
                ProgressView()
            case .error:
                Text(LocalizedContent.Common.somethingWentWrong)
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
                    Text(Localization.ingredients)
                        .font(.title)
                    
                    VStack(alignment: .leading) {
                        ForEach(meal.ingredients) { ingredient in
                            HStack {
                                Text(ingredient.name)
                                Spacer()
                                Text(ingredient.measure)
                            }
                            .accessibilityElement(children: .combine)
                            
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

#Preview {
    NavigationView {
        MealDetail.Content(meal: .preview)
            .padding()
    }
    .navigationViewStyle(.stack)
}
