//
//  CustomCell.swift
//  HistorialNetworking
//
//  Created by Farley Achinte on 21/09/16.
//  Copyright © 2016 Farley Achinte. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {
    
    @IBOutlet var placa: UILabel!
    @IBOutlet var carro: UILabel!
    @IBOutlet var imagen: UIImageView!
    @IBOutlet var precio: UILabel!
    @IBOutlet var fecha: UILabel!
    
    override func awakeFromNib() {
     
        
        super.awakeFromNib()
        
        imagen.layer.borderWidth=0.2
        imagen.layer.masksToBounds = false
        imagen.layer.cornerRadius = 34
        imagen.clipsToBounds = true
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
