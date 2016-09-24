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
    
    func bypassAuthentication() {

        let manager = Alamofire.SessionManager.default
        manager.delegate.sessionDidReceiveChallenge = { session, challenge in
            var disposition: URLSession.AuthChallengeDisposition = .performDefaultHandling
            var credential:URLCredential?
            if challenge.protectionSpace.authenticationMethod == NSURLAuthenticationMethodServerTrust {
                disposition = URLSession.AuthChallengeDisposition.useCredential
                credential = URLCredential(trust: challenge.protectionSpace.serverTrust!)
            } else {
                if challenge.previousFailureCount > 0 {
                    disposition = .cancelAuthenticationChallenge
                } else {
                    credential = manager.session.configuration.urlCredentialStorage?.defaultCredential(for: challenge.protectionSpace)
                    if credential != nil {
                        disposition = .useCredential
                    }
                }
            }
            return (disposition, credential)
        }
    }
    
    func translateText(language: String, text: String, completionHandler:@escaping (_ data: String) -> ()) -> () {
        bypassAuthentication()
        Alamofire.request("https://api-platform.systran.net/translation/text/translate", parameters: ["key":"e1c5251c-4b1c-4808-846f-9fbd8e60a00e","source":"auto","target":language,"input":text]).responseJSON { response in
            print(response)
                let translateResponse = response.result.value
                completionHandler(((translateResponse as! NSDictionary).value(forKeyPath: "outputs.output")! as! NSArray)[0] as! String)
        }
        
        
    }
    
}
