//
//  WebService.swift
//  GoodNews
//
//  Created by Serhan Khan on 19/04/2020.
//  Copyright © 2020 Serhan Khan. All rights reserved.
//

import Foundation


class WebService {
    
    
    func getArticles(url:URL,completion: @escaping([Article]?) -> ()) {
        URLSession.shared.dataTask(with: url) {data,response, error in
            if let err = error {
                print (err.localizedDescription)
                completion(nil)
            }else if let data = data {
                let articleList = try? JSONDecoder().decode(ArticleList.self, from: data)
                if let articleList = articleList {
                    completion(articleList.articles)
                }
            }
            
            
        }.resume()
    }
    
}
