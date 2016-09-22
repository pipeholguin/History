//
//  HistorialApi.swift
//  HistorialNetworking
//
//  Created by Farley Achinte on 21/09/16.
//  Copyright © 2016 Farley Achinte. All rights reserved.
//

import Foundation
import Alamofire

class HistorialApi{
    
    func loadHistorial(callback:@escaping (_ data:[Historial])->Void){
        Alamofire.request("http://192.168.1.111:3000/getHistorial", method: .post, parameters: ["token": 11111], encoding: JSONEncoding.default).responseJSON{ response in
            //  print(response.request)  // original URL request
            //  print(response.response) // URL response
            //  print(response.data)     // server data
            let data = (response.result.value) as! NSDictionary
            let cod = data["codigo"] as! String
            switch cod {
            case "001":
                let content = data["contenido"] as! NSArray
                var historial:[Historial] = [Historial]()
                for i in 0 ..< content.count
                {
                    let histo_obj = content[i] as! NSDictionary
                    let numPlaca = histo_obj["placa"] as! String
                    let texCarro = histo_obj["modelo"] as! String
                    let texPrecio = histo_obj["precio"] as! String
                    let stringimg = histo_obj["imagen"] as! String
                    let texfecha = histo_obj["fecha"] as! String
                    let texnombre = histo_obj["nombre"] as! String
                    
                    let h = Historial()
                    h.fecha = texfecha
                    h.placa = numPlaca
                    h.modelo = texCarro
                    h.precio = texPrecio
                    h.nombre = texnombre
                    h.imagenperfil = stringimg
                    historial.append(h)
                    
                }
                
                callback(historial)
                
            case "002":
                print ("error")
                
            default:
                print("null")
                
            }
            
            
        }

    }
    
}
