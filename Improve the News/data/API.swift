//
//  API.swift
//  Improve the News
//
//  Created by Federico Lopez on 03/11/2021.
//

import Foundation
import UIKit


func API_BASE_URL() -> String {
    return "https://www.improvemynews.com" //!!!
}


class API {
    
    static var shared = API()
    
    func newsUrl(topic: String,
        itemsForTopic A: Int = 4,
        itemsForSubTopics B: Int = 4,
        skip S: Int = 0) -> String {
        
        var result = API_BASE_URL() + "/appserver.php/?topic=" + topic + "."
        
        result += "A" + String(A) + "."
        result += "B" + String(B) + "."
        result += "S" + String(S)
        
        result += "&sliders="
        result += "LR50PE50NU70DE70SL70RE70SS00LA00yT01VA00VB00VC00VM00VE33oB11" //!!!
        
        result += "&uid=" + API.UID()
        result += "&v=I" + Bundle.main.releaseVersionNumber!
        result += "&dev=" + DEVICE_NAME()
        
        return result
    }
    
    func loadData() {
        let reqUrl = URL(string: newsUrl(topic: "news"))!
        
        var request = URLRequest(url: reqUrl)
        request.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if(error != nil) {
                print("Error in API/loadData: \(error)")
                return
            }
            
            if let _response = response as? HTTPURLResponse, let _data = data {
                let statusCode = _response.statusCode
                let text = String(data: _data, encoding: .utf8)
                
                print("")
                
                if(statusCode == 200) { //ok!
                    
                } else {
                    print("Error in API/loadData, http statusCode \(statusCode)")
                }
            }
        }
        
        task.resume()
    }
}





extension API {
    
    static func UID() -> String {
        var result = "3"
        let limit = 19
    
        if let deviceId = UIDevice.current.identifierForVendor?.uuidString {
            var fixedID = deviceId.uppercased()
            fixedID = fixedID.replacingOccurrences(of: "-", with: "")
            fixedID = fixedID.replacingOccurrences(of: "A", with: "0")
            fixedID = fixedID.replacingOccurrences(of: "B", with: "1")
            fixedID = fixedID.replacingOccurrences(of: "C", with: "2")
            fixedID = fixedID.replacingOccurrences(of: "D", with: "3")
            fixedID = fixedID.replacingOccurrences(of: "E", with: "4")
            fixedID = fixedID.replacingOccurrences(of: "F", with: "5")
        
            if(fixedID.count > (limit-1)) {
                fixedID = String( fixedID[0...(limit-2)] )
            }
            result += fixedID
        }
        
        return result
    }
    
    
    
}
