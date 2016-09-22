//
//  NextViewController.swift
//  HistorialNetworking
//
//  Created by Farley Achinte on 21/09/16.
//  Copyright © 2016 Farley Achinte. All rights reserved.
//

import UIKit

class NextViewController: UIViewController {
    
    @IBOutlet var imagenPerfil: UIImageView!
    @IBOutlet var nombre: UILabel!
    @IBOutlet var modelo: UILabel!
    @IBOutlet var fecha: UILabel!
    @IBOutlet var precio: UILabel!
    
    var selected:Historial!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadDetail()
        imagenPerfil.layer.borderWidth=0.2
        imagenPerfil.layer.masksToBounds = false
        imagenPerfil.layer.cornerRadius = 34
        imagenPerfil.clipsToBounds = true

        
    

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func loadDetail(){
    
        print(selected.imagenperfil)
        print(selected.modelo)
        print(selected.nombre)
        print(selected.placa)
        print(selected.fecha)
        print(selected.precio)
        
        self.nombre.text = selected.nombre
        self.fecha.text = selected.fecha
        self.precio.text = selected.precio
        self.modelo.text = selected.modelo + " " + selected.placa
        self.imagenPerfil.sd_setImage(with: URL(string:selected.imagenperfil))
       
    }

}
