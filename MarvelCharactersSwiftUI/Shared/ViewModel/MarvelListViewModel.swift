//
//  MarvelListViewModel.swift
//  MarvelCharactersSwiftUI
//
//  Created by Mario Andres Heberthardt Marchant on 21/12/21.
//

import SwiftUI
import Combine

class MarvelListViewModel: ObservableObject {
    
    @Published var searchQuery = ""
    
    var searchCancellable: AnyCancellable? = nil
    
    init() {
        
        searchCancellable = $searchQuery
        
            .removeDuplicates()
            .debounce(for: 0.6, scheduler: RunLoop.main)
            .sink(receiveValue: { str in
                
                if str == "" {
                    // reset...
                }else {
                    //search...
                    print("WORKS \(str)")
                }
                
            })
    }
    
}
