//
//  FavFunc.swift
//  Adl

import Foundation
import SwiftUI

class ViewModel: ObservableObject {
    @Published var items = [Asmaa]()
    @Published var showingFavs = false
    @Published var savedItems: Set<Int> = [1, 7]
    
    // Filter saved items
    var filteredItems: [Asmaa]  {
        if showingFavs {
            return items.filter { savedItems.contains($0.id) }
        }
        return items
    }
    
    private var db = NameDatabase()
    
    init() {
        self.savedItems = db.load()
        self.items = Asmaa.Names
    }
    
    func sortFavs() {
        withAnimation() {
            showingFavs.toggle()
        }
    }
    
    func contains(_ item: Asmaa) -> Bool {
            savedItems.contains(item.id)
        }
    
    // Toggle saved items
    func toggleFav(item: Asmaa) {
        if contains(item) {
            savedItems.remove(item.id)
        } else {
            savedItems.insert(item.id)
        }
        db.save(items: savedItems)
        self.savedItems = db.load()
    }
}
