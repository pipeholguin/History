//
//  ViewController.swift
//  HistorialNetworking
//
//  Created by Farley Achinte on 21/09/16.
//  Copyright © 2016 Farley Achinte. All rights reserved.
//

import UIKit
import Alamofire
import SDWebImage



class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{

    @IBOutlet var tableView: UITableView!
    
    var historial:[Historial]!
    var api:HistorialApi!
   
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        
        historial = [Historial]()
        api = HistorialApi()
        historial = [Historial]()
        //loadData()
        api.loadHistorial { (data:[Historial])->Void in
            self.historial = data
            self.tableView.reloadData()
        }
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return historial.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomCell
        
        let h:Historial = historial[indexPath.row]
        cell.placa.text = h.placa
        cell.carro.text = h.modelo
        cell.precio.text = h.precio
        cell.fecha.text = h.fecha
        
        cell.imagen .sd_setImage(with: URL(string:h.imagenperfil)!)
        
        
        return cell
    }
    
  
    
    
    
   /* func loadImage(url:String, pos:Int,  callback:@escaping (_ data:Data?)->Void){
        let urlSession = URL(string:url)
        let session = URLSession.shared;
        session.dataTask(with: urlSession!) { (data:Data?, response:URLResponse?, error:Error?) -> Void in
            callback(data)
        }
    }*/
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let index = tableView.indexPathForSelectedRow?.row
        let h = historial[index!]
        
        let next:NextViewController = segue.destination as! NextViewController
        next.selected = h
        
    }


}

