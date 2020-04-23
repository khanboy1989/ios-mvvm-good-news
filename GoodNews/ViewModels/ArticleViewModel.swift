//
//  ArticleViewModel.swift
//  GoodNews
//
//  Created by Serhan Khan on 19/04/2020.
//  Copyright © 2020 Serhan Khan. All rights reserved.
//

import Foundation


struct ArticleListViewModel {
    let articles:[Article]
}

extension ArticleListViewModel {
    var numberOfSections:Int {
        return 1
    }
    
    func numberOfRowsInSection(_ section:Int) -> Int{
        return self.articles.count
    }
    
    func articleAtIndex(_ index:Int)->ArticleViewModel {
        let article = self.articles[index]
        return ArticleViewModel(article)
    }
}

//Responsible to display only one article model
struct ArticleViewModel {
    private let article:Article
}

extension ArticleViewModel {
    init(_ article:Article){
        self.article = article
    }
}

extension ArticleViewModel {
    var title:String? {
        return self.article.title
    }
    
    var description:String?{
        return self.article.description
    }
}

