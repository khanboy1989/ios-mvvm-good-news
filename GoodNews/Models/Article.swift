//
//  Article.swift
//  GoodNews
//
//  Created by Serhan Khan on 19/04/2020.
//  Copyright © 2020 Serhan Khan. All rights reserved.
//

import Foundation


struct ArticleList:Decodable {
    let articles:[Article]
}

struct Article:Decodable {
    var title:String?
    var description:String?
}
