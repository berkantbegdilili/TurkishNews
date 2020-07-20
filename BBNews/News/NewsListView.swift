//
//  NewsView.swift
//  BBNews
//
//  Created by Berkant Beğdilili on 19.07.2020.
//

import SwiftUI


struct NewsListView: View {
    
    @ObservedObject var news: NewsViewModel
    
    var listScene: some View{
        Button(action: {
            news.listType.toggle()
        }, label: {
            Image(systemName: news.listType ? "rectangle.grid.1x2":"rectangle.3.offgrid")
                
        })
        .foregroundColor(.secondary)
    }
    
    var body: some View {
        
        NavigationView{
            VStack{
                
                HStack{
                    Spacer()
                    
                    listScene
                        .padding()
                }
                
                ScrollView{
                    
                    if news.listType {
                        GridStack(rows: news.list.count/2, columns: 2){ row, col in
                            
                            NavigationLink(
                                destination: NewsDetailView(new: news.list[row+2 * col], pickerIsHidden: $news.pickerIsHidden).onAppear {
                                    news.pickerIsHidden = true
                                },
                                label: {
                                    NewsView(new: news.list[row+2 * col], listType: $news.listType)
                                        .padding()
                                        .overlay(Rectangle()
                                                    .stroke()
                                                    .foregroundColor(.secondary))
        
                                }).buttonStyle(PlainButtonStyle())
                            
                        }.padding()
                    }else {
                        ForEach(news.list){ new in
                            
                            NavigationLink(
                                destination: NewsDetailView(new: new, pickerIsHidden: $news.pickerIsHidden).onAppear {
                                    news.pickerIsHidden = true
                                },
                                label: {
                                    NewsView(new: new, listType: $news.listType)
                                        .padding()
                                    
                                }).buttonStyle(PlainButtonStyle())
                    

                            Divider()
                                .foregroundColor(.secondary)
                        }
                    }
                }
            
           
            }.navigationBarHidden(true)

            
        }
        
         
    }
}
