//
//  TomorrowTableViewCell.swift
//  ming
//
//  Created by Sojin Lee on 2022/05/22.
//

import UIKit

class TomorrowTableViewCell: UITableViewCell {

    static let identifier = "TomorrowTableViewCell"
    @IBOutlet weak var miracleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setData(_ data: TomorrowDataModel){
        miracleLabel.text = data.miracleText
    }
}
