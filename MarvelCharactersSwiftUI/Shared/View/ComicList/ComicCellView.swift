//
//  ComicCellView.swift
//  MarvelCharactersSwiftUI
//
//  Created by Mario Andres Heberthardt Marchant on 7/1/22.
//

import SwiftUI

struct ComicCellView: View {
    let comicList: ComicResults
    
    var body: some View {
        HStack(){
            
            let urlString = URL(string: (comicList.thumbnail?.path ?? "")+ImagesStyles.standard_xlarge.rawValue+ImagesStyles.jpg.rawValue)!
           
           AsyncImage(url: urlString, content: { image in
               image
                   .resizable()
                   .cornerRadius(15)
                   .aspectRatio(contentMode: .fill)
                   .frame(width: 150, height: 150)
           },placeholder: {
               Image(systemName: "photo")
                   .resizable()
                   .foregroundColor(.purple)
                   .scaledToFit()
                   .frame(width: 150, height: 150)
           })
            
        }
    }
    
    func getURL(data: URLElement) -> URL {
        let url = data.url
        
        return URL(string: url)!
    }
    
    func getType(data: URLElement) -> String {
        let type = data.type
        
        return type.capitalized
    }
}
