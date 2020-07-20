//
//  NewsModel.swift
//  BBNews
//
//  Created by Berkant Beğdilili on 19.07.2020.
//

import Foundation

struct NewsModel: Codable{
    var status:String
    var totalResults:Int
    var articles:[Articles]
}


struct Source: Codable{
    var id:String?
    var name:String
}

struct Articles: Codable,Identifiable {
    let id = UUID()
    var source:Source
    var author:String?
    var title:String
    var description:String?
    var url:URL?
    var urlToImage:URL?
    var publishedAt:String
    var content:String?
}
