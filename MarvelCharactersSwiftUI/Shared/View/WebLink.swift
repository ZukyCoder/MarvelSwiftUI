//
//  WebLink.swift
//  MarvelCharactersSwiftUI
//
//  Created by Mario Andres Heberthardt Marchant on 1/1/22.
//

import SwiftUI
import WebKit

struct WebLink: UIViewRepresentable {
    
    var url: URL

    
    func makeUIView(context: Context) -> WKWebView {
        
        let view = WKWebView()
        view.load(URLRequest(url: url))
        
        return view
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        
    }
    
    
}
