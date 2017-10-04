//
//  LiveTableViewCell.swift
//  YNLive
//
//  Created by libo on 2017/10/3.
//  Copyright © 2017年 libo. All rights reserved.
//

import UIKit

class LiveTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imgPor:UIImageView!
    

    @IBOutlet weak var labelNick:UILabel!
    
    @IBOutlet weak var libAddr:UILabel!
    
    @IBOutlet weak var labelViewers:UILabel!
    
    @IBOutlet weak var imgBigPor:UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
