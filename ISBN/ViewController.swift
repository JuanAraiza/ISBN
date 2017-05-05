//
//  ViewController.swift
//  ISBN
//
//  Created by Mac Juan Araiza on 05/05/17.
//  Copyright © 2017 Juan Araiza. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var isbn: UITextField!
    @IBOutlet weak var resultado: UITextView!
    
    
    @IBAction func limpiar(_ sender: Any) {
        self.isbn.text=""
        self.resultado.text=""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func buscar(_ sender: Any) {
        self.resultado.text = sincrono(isbn : self.isbn.text!)
    }
    @IBAction func enterBuscar(_ sender: Any) {
         self.resultado.text = sincrono(isbn : self.isbn.text!)
        
    }
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnBuscar(_ sender: Any) {
        
        self.resultado.text = sincrono(isbn : self.isbn.text!)
        
        
    }
    func sincrono(isbn : String) -> String{
        let urls="https://openlibrary.org/api/books?jscmd=data&format=json&bibkeys=ISBN:\(isbn)"
        let url = URL(string: urls)
        let datos:NSData? = NSData(contentsOf: url!)
        let texto = NSString(data:datos! as Data, encoding:String.Encoding.utf8.rawValue)!
        
        if texto == "{}" {
            return "No hay datos disponibles para este ISBN"
        }else{
            return texto as String
        }
        
    }
    

}

