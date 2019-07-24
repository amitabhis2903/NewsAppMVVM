//
//  NewsTableViewController.swift
//  NewsAppMVVM
//
//  Created by A on 24/07/19.
//  Copyright © 2019 A. All rights reserved.
//

import UIKit

class NewsTableViewController: UITableViewController {

    
    private var articleListVM: ArticleListViewModel!
    
    private let spinner = UIActivityIndicatorView(style: .gray)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(spinner)
        spinner.center = view.center
        setup()
    }

    private func setup() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.spinner.startAnimating()
        Service.shared.getData(urlString: URL_STRING) { articles,error  in
            
            if error != nil {
                fatalError("Error got")
            }
            
            guard let articles = articles else {
                return
            }
            self.articleListVM = ArticleListViewModel(articles: articles)
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.spinner.stopAnimating()
            }
        }
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.articleListVM == nil ? 0 : articleListVM.numberOfSection
    }
    
    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.articleListVM.numberOfRowInSection(section)
    }
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "articleCell", for: indexPath) as? ArticleTableViewCell else {
            fatalError("Artictle table view cell not found")
        }
        
        let articleVM = self.articleListVM.articleAtIndex(indexPath.row)
        
        cell.titleLbl.text = articleVM.title
        cell.descriptionLbl.text = articleVM.description
        cell.newsImage.downloadImageFromUrl(urlString: articleVM.urlToImage)

        
        return cell 
    }
}
