//
//  NewsListTableViewController.swift
//  GoodNews
//
//  Created by Serhan Khan on 19/04/2020.
//  Copyright © 2020 Serhan Khan. All rights reserved.
//

import Foundation
import UIKit

class NewsListTableViewController:UITableViewController {
    
    private var articleListViewModel:ArticleListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        
        let url = URL(string: Feeds.news_url)!
        
        WebService().getArticles(url: url){ articles in
            if let articles = articles {
                self.articleListViewModel = ArticleListViewModel(articles: articles)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }else {
                DispatchQueue.main.async {
                    let alert = UIAlertController(title: "Error", message: "An error occured.", preferredStyle: UIAlertController.Style.alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }
                
            }
        }
        
        self.navigationController?.navigationBar.prefersLargeTitles = true 
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.articleListViewModel == nil ? 0 :self.articleListViewModel.numberOfSections
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articleListViewModel.numberOfRowsInSection(section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleTableViewCell", for: indexPath) as? ArticleTableViewCell else {
            return UITableViewCell()
        }
        
        let articleVM =  self.articleListViewModel.articleAtIndex(indexPath.row)
        
        cell.titleLabel.text = articleVM.title
        cell.descriptionLabel.text = articleVM.description
        
        return cell 
    }
}
