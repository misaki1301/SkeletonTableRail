//
//  CustomTableViewCell.swift
//  skeleton-table-rail
//
//  Created by Paul Frank on 4/02/24.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

	static let identifier = "CustomTableViewCell"
	
	@IBOutlet var myLabel: UILabel!
	@IBOutlet var myImageView: UIImageView!
	
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
