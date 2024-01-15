//
//  ContentView.swift
//  Cookcademy
//
//  Created by Hannah Williams on 14/01/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State var recipes = Recipe.testRecipes
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, cooking world!")
            List {
                ForEach(Category.allCases, id: \.rawValue) { item in
                    Section(header: Text(item.rawValue)) {
                        ForEach(recipes.filter{$0.mainInformation.category == item}, id: \.mainInformation.name) { recipe in
                            Text(recipe.mainInformation.name)
                        }
                    }
                }
            }
            Button("Add new recipe") {
                recipes.append(Recipe(mainInformation: MainInfo(name: "New recipeee",
                                                                description: "yumm",
                                                                author: "Hannah",
                                                                category: .dessert),
                               ingredients: [
                                Ingredient(name: "food", quantity: 454, unit: .g),
                                Ingredient(name: "more food", quantity: 1, unit: .tbs),
                                Ingredient(name: "carrots", quantity: 0.5, unit: .cups),
                                Ingredient(name: "pepper", quantity: 2, unit: .tsp)
                               ],
                               directions:  [
                                Direction(description: "do something", isOptional: false),
                                Direction(description: "do something else", isOptional: true),
                                Direction(description: "defo don't forget this", isOptional: false),
                                Direction(description: "then to finish", isOptional: false)
                               ]
                        ))
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
