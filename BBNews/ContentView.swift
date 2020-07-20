//
//  ContentView.swift
//  BBNews
//
//  Created by Berkant Beğdilili on 19.07.2020.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var news: NewsViewModel
    
    
    var category = ["Öne Çıkanlar","İş","Eğlence","Sağlık","Bilim","Spor","Teknoloji"]
    
    var body: some View {
        
        VStack{
            
            if !news.pickerIsHidden {
                ScrollView(.horizontal, showsIndicators: false){
                    Picker("", selection: $news.selectedPicker){
                        ForEach(0..<category.count){
                            Text(category[$0])
                                .font(.headline)
                                .textCase(.uppercase)
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                    .padding(.top,25)
                    .padding(.bottom,10)
                }
            }
            
            NewsListView(news: news)
            
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
