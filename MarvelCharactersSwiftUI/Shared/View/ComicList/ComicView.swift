//
//  ComicView.swift
//  MarvelCharactersSwiftUI
//
//  Created by Mario Andres Heberthardt Marchant on 7/1/22.
//

import SwiftUI

struct ComicView: View {
    
    @EnvironmentObject var comicListData: MarvelListViewModel
    
    var body: some View {
        
        NavigationView{
            ScrollView(.vertical, showsIndicators: false, content: {
                if comicListData.ComicListArray == nil{
                    ProgressView()
                        .padding(.top, 30)
                }else {
                
                    ForEach(comicListData.ComicListArray ?? []) { comic in
                        Text("TEST")
                    }
                    
                }
            })
            
        }
        .onAppear(perform: {
            if comicListData.ComicListArray == nil {
                comicListData.listOfComics()
            }
        })
    }
}

//struct ComicView_Previews: PreviewProvider {
//    static var previews: some View {
//        ComicView()
//    }
//}
