//
//  SearchViewController.swift
//  GitAPI
//
//  Created by Miran Hrupački on 20.07.2022..
//

import UIKit

class SearchViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var filterView: FilterOptionsView!
    @IBOutlet weak var searchTextfield: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        tableView.register(UINib(nibName: "SearchListTableViewCell", bundle: nil), forCellReuseIdentifier: "SearchListTableViewCellIdentifier")
        filterView.setButtonsTitle(titles: ["Forks", "Stars", "Updated"])
    }
    
    @objc func showAuthorDetails(_ sender: Any) {
        let authorDetailsVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AuthorDetailsViewControllerIdentifier") as! AuthorDetailsViewController
        
        self.navigationController?.pushViewController(authorDetailsVC, animated: true)
    }
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchListTableViewCellIdentifier") as! SearchListTableViewCell
        cell.authorImage.addTarget(cell.authorImage, action: #selector(showAuthorDetails(_:)), for: .touchUpInside)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let repoDetailsVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "RepoDetailsViewControllerIdentifier") as! RepoDetailsViewController
        self.navigationController?.pushViewController(repoDetailsVC, animated: true)
    }
}
