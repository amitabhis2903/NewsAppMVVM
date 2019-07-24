//
//  ArticleViewModel.swift
//  NewsAppMVVM
//
//  Created by A on 24/07/19.
//  Copyright © 2019 A. All rights reserved.
//

import Foundation

//This Article Model responsible for displaying just one articles not whole articles. This is Base Class
struct ArticleViewModel {
    private let article: Article
}

//Intialize Article View Model
extension ArticleViewModel {
    init(_ article: Article) {
        self.article = article
    }
}

extension ArticleViewModel {
    
    var title: String {
        return self.article.title
    }
    
    var description: String {
        return self.article.description
    }
}
