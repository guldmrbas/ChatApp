//
//  ChatTableViewCell.swift
//  ChatApp
//
//  Created by Gülsüm Demirbaş on 25.04.2024.
//

import UIKit

class ChatTableViewCell: UITableViewCell {

    
    @IBOutlet weak var usernameLbl: UILabel!
    
    @IBOutlet weak var userIV: UIImageView!
    
    @IBOutlet weak var messageLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
