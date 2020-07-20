//
//  NewsView.swift
//  BBNews
//
//  Created by Berkant Beğdilili on 19.07.2020.
//

import SwiftUI
import SDWebImageSwiftUI

struct NewsView: View {
    
    let new:Articles
    @Binding var listType:Bool
    
    var body: some View {
        
        VStack(alignment: .leading){
           
            if listType {
                WebImage(url: new.urlToImage)
                    .resizable()
                    .clipped()
                    .frame(minWidth:0,maxWidth: .infinity)
                    .frame(height: 100)
                
                Text(new.title)
                    .font(.headline)
            }else {
                HStack(alignment: .center,spacing: 10){
                    Text(new.title)
                        .font(.headline)
                    
                    WebImage(url: new.urlToImage)
                        .resizable()
                        .clipped()
                        .frame(width: 150, height: 100)
                }
            }
            
        }
        
    }
}
