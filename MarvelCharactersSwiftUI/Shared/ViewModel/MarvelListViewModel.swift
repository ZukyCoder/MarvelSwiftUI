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
    @Published var CharacterListArray: [Results]? = nil
    @Published var ComicListArray: [ComicResults]? = nil
    @Published var offset: Int = 0
    
    var serviceProxy: Service?
    var searchCancellable: AnyCancellable? = nil
    
    init() {
        
        self.serviceProxy = Service()
        
        searchCancellable = $searchQuery
        
            .removeDuplicates()
            .debounce(for: 0.6, scheduler: RunLoop.main)
            .sink(receiveValue: { str in
                
                if str == "" {
                    // reset...
                    self.CharacterListArray = nil
                }else {
                    //search...
                    self.CharacterListArray = nil
                    self.searchCharacters()
                }
                
            })
    }
    
    
    func searchCharacters(){
        let originalQuery = searchQuery
        serviceProxy?.getCharactersByName(name: originalQuery) { res in
            switch res {
            case .success(let list):
                DispatchQueue.main.async {
                    if self.CharacterListArray == nil {
                        self.CharacterListArray = list
                    }
                }
            case .failure(_):
                print("Error")
            }
            
        }
    }
    
    func listOfCharacters() {
        serviceProxy?.getCharactersList(offsetList: offset, limitList: 30) { res in
            switch res {
            case .success(let list):
                DispatchQueue.main.async {
                    if self.CharacterListArray == nil {
                        self.CharacterListArray = list
                    }
                }
            case .failure(_):
                print("Error")
            }
            
        }
    }
    
    func listOfComics() {
        serviceProxy?.getComicsList(offsetList: offset, limitList: 30, completion: { res in
            switch res {
            case .success(let list):
                DispatchQueue.main.async {
                    if self.ComicListArray == nil {
                        self.ComicListArray = list
                    }
                }
            case .failure(_):
                print("Error")
            }
            
        })
    }
    
}
