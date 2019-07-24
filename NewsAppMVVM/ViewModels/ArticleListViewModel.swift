//
//  ArticleListViewModel.swift
//  NewsAppMVVM
//
//  Created by A on 24/07/19.
//  Copyright © 2019 A. All rights reserved.
//

import Foundation


//This is responsible for displaying whole articles. It is parent class. Displaying the data on table view

struct ArticleListViewModel {
    let articles: [Article]
}

//Provide those function to display data on tableView like no of rows , section and cell data
extension ArticleListViewModel {
    
    //Number of section in table view
    var numberOfSection: Int {
        return 1
    }
    
    //Number of row in section table view
    func numberOfRowInSection(_ section: Int) -> Int {
        return articles.count
    }
    
    //Article at index
    func articleAtIndex(_ index: Int) -> ArticleViewModel {
        let article = self.articles[index]
        return ArticleViewModel(article)
    }
    
}
