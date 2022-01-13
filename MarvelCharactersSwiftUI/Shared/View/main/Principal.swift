//
//  Principal.swift
//  MarvelCharactersSwiftUI
//
//  Created by Mario Andres Heberthardt Marchant on 21/12/21.
//

import SwiftUI

struct Principal: View {
    
    @StateObject var listData = MarvelListViewModel()
    
    
    var body: some View {
        TabView{
            MarvelListView()
                .tabItem{
                    Image(systemName: "person.3.sequence.fill")
                    Text("Charaters")
                }
                .environmentObject(listData)
            ComicView()
                .tabItem{
                    Image(systemName: "book.circle")
                    Text("Comics")
                }
                .environmentObject(listData)
        }
    }
}

struct Principal_Previews: PreviewProvider {
    static var previews: some View {
        Principal()
    }
}
