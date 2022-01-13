//
//  CharacterCellView.swift
//  MarvelCharactersSwiftUI
//
//  Created by Mario Andres Heberthardt Marchant on 23/12/21.
//

import SwiftUI

struct CharacterCellView: View {
    var character: Results
    
    var body: some View {
        
        HStack{
            
             let urlString = URL(string: (character.thumbnail?.path ?? "")+ImagesStyles.standard_xlarge.rawValue+ImagesStyles.jpg.rawValue)!
            
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
        
            
            VStack(alignment: .leading, spacing: 8, content: {
                Text(character.name)
                    .font(.title3)
                    .fontWeight(.bold)
                Text(character.resultDescription)
                    .font(.caption)
                    .foregroundColor(.gray)
                    .lineLimit(4)
                    .multilineTextAlignment(.leading)
                
                HStack(spacing: 10) {
                    ForEach(character.urls, id: \.self){ data in
                        
                        NavigationLink(destination: WebLink(url: getURL(data: data))
                                        .navigationTitle(getType(data: data)),
                                       label: {
                                Text(getType(data:data))
                        })
                        
                    }
                    
                }
                
            })
            
            Spacer(minLength: 0)
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


