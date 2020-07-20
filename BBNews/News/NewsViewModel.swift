//
//  NewsViewModel.swift
//  BBNews
//
//  Created by Berkant Beğdilili on 19.07.2020.
//

import Alamofire
import SwiftUI

class NewsViewModel: ObservableObject{
    
    @Published var list:[Articles] = [Articles](){
        didSet{
            objectWillChange.send()
        }
    }
    
    @Published var selectedPicker = 0{
        didSet{
            fetchData()
            objectWillChange.send()
        }
    }

    @Published var listType = false {
        didSet{
            objectWillChange.send()
        }
    }
    
    @Published var pickerIsHidden = false {
        didSet{
            objectWillChange.send()
        }
    }
    
    init(){
        fetchData()
    }
    
    func fetchData(){
        
        let filterCategory = filtering()
        
        guard let url = URL(string: "http://newsapi.org/v2/top-headlines") else { return }
        
        let parameters:[String:String] = ["country":"tr","category":filterCategory,"apiKey":"API-KEY"]
        
        let encoder = URLEncodedFormParameterEncoder(encoder: URLEncodedFormEncoder(alphabetizeKeyValuePairs: false))
        
        AF.request(url, parameters: parameters, encoder: encoder)
            .responseJSON{ response in
                if let data = response.data {
                    
                    do {
                        
                        let newsList = try JSONDecoder().decode(NewsModel.self, from: data)
                            
                        DispatchQueue.main.async {
                            if newsList.status == "ok" {
                                    
                                self.list = newsList.articles
                                
                            }
                        }
                        
  
                    } catch  {
                        print(error.localizedDescription)
                    }
                    
                }
            }
    }
    
    func filtering() -> String{
        
        var category:String
        
        switch selectedPicker{
            case 1:
                category = "business"
            case 2:
                category = "entertainment"
            case 3:
                category = "health"
            case 4:
                category = "science"
            case 5:
                category = "sports"
            case 6:
                category = "technology"
            default:
                category = ""
        }
        
        return category
    }
    
     
}
