//
//  TranslateModel.swift
//  ActionExtensionDemo
//
//  Created by Pranav Kasetti on 19/09/2016.
//  Copyright © 2016 Pranav Kasetti. All rights reserved.
//

import UIKit
import Alamofire

class TranslateModel: NSObject {
    
    func translateText(language: String, text: String) {
        
        Alamofire.request("https://api-platform.systran.net/translation/text/translate", parameters: ["key":"e1c5251c-4b1c-4808-846f-9fbd8e60a00e","source":"auto","target":language,"input":text]).responseJSON { response in
            print(response)
            DispatchQueue.main.async {
                let translateResponse = response.result.value
                print(translateResponse)
                
            }
        }
        
        
    }
    
}
