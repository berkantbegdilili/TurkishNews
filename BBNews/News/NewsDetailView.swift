//
//  NewsDetailView.swift
//  BBNews
//
//  Created by Berkant Beğdilili on 20.07.2020.
//

import SwiftUI

struct NewsDetailView: View {
    
    let new:Articles
    @Binding var pickerIsHidden: Bool
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        
        VStack(alignment: .leading){
            
            HStack{
                
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                    pickerIsHidden = false
                }, label: {
                    Image(systemName: "chevron.left")
                        .font(.system(size: 25))
                        .foregroundColor(.secondary)
                }).padding(.horizontal)
                
                
                Text(new.source.name)
                    .bold()
        
            }.padding(.top)

            WebView(URL: new.url!)
            
        }.navigationBarHidden(true)
         
    }
}

