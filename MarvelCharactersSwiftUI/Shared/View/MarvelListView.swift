//
//  MarvelListView.swift
//  MarvelCharactersSwiftUI
//
//  Created by Mario Andres Heberthardt Marchant on 21/12/21.
//

import SwiftUI

struct MarvelListView: View {
    @EnvironmentObject var listData: MarvelListViewModel
    
    var body: some View {
        
        NavigationView() {
            
            ScrollView(.vertical, showsIndicators: false, content: {
                
                VStack(spacing: 15) {
                    // searchBar
                    HStack(spacing: 10) {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                        TextField("Search Character", text: $listData.searchQuery)
                    }
                    .padding(.vertical, 10)
                    .padding(.horizontal)
                    .background(.white)
                    .shadow(color: .black.opacity(0.06), radius: 5, x: 5, y: 5)
                    .shadow(color: .black.opacity(0.06), radius: 5, x: -5, y: -5)
                }
                .padding()
            })
                .navigationTitle("Marvel Characters")
        }
    }
}

struct MarvelListView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
