//
//  Recipe.swift
//  Cookcademy
//
//  Created by Hannah Williams on 14/01/2024.
//

import Foundation

struct Recipe {
    var mainInformation: MainInfo
    var ingredients: [Ingredient]
    var directions: [Direction]
}

struct MainInfo {
    var name: String
    var description: String
    var author: String
    var category: Category
}

enum Category: String, CaseIterable {
    case breakfast = "Breakfast"
    case lunch = "Lunch"
    case dinner = "Dinner"
    case dessert = "Dessert"
}


struct Ingredient {
    var name:String
    var quantity: Double
    var unit: Unit
    
    enum Unit: String, CaseIterable {
        case oz = "Ounces"
        case g = "Grams"
        case cups = "Cups"
        case tbs = "Tablespoons"
        case tsp = "Teaspoons"
        case none = "No units"
        
        var singularName: String { String(rawValue.dropLast()) }
    }
}

struct Direction {
    var description: String
    var isOptional: Bool
}
