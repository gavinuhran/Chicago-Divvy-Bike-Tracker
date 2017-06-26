//
//  ViewControllerTableViewCell.swift
//  divvyBike
//
//  Created by Gavin Uhran on 6/26/17.
//  Copyright © 2017 Gavin Uhran. All rights reserved.
//

import UIKit

class ViewControllerTableViewCell: UITableViewCell
{
    @IBOutlet weak var cellLabel: UILabel!
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)
    }
}
