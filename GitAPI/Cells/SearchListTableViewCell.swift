//
//  SearchListTableViewCell.swift
//  GitAPI
//
//  Created by Miran Hrupački on 20.07.2022..
//

import UIKit

class SearchListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var authorImage: UIButton!
    @IBOutlet weak var authorName: UILabel!
    @IBOutlet weak var repoName: UILabel!
    @IBOutlet weak var nmbrOfForks: UILabel!
    @IBOutlet weak var nmbrOfIssues: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        authorImage.layer.borderWidth = 1
        authorImage.layer.borderColor = UIColor.darkGray.cgColor
        authorImage.layer.cornerRadius = authorImage.frame.size.width / 2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
}
