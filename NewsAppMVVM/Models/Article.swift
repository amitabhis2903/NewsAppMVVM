//
//  Article.swift
//  NewsAppMVVM
//
//  Created by A on 24/07/19.
//  Copyright © 2019 A. All rights reserved.
//

import Foundation

struct ArticleList: Decodable {
    let articles: [Article]
}


struct Article: Decodable {
    let title: String
    let description: String
}
