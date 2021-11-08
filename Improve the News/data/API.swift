//
//  API.swift
//  Improve the News
//
//  Created by Federico Lopez on 03/11/2021.
//

import Foundation
import UIKit
import SwiftyJSON


func API_BASE_URL() -> String {
    return "https://www.improvemynews.com" //!!!
}


class API {
    
    func loadData(topic: String = "news",
        itemsForTopic A: Int = 4,
        itemsForSubTopics B: Int = 4,
        skip S: Int = 0,
        callback: @escaping (Bool, [Topic]) ->()) {
        
        let reqUrl = newsUrl(topic: topic, itemsForTopic: A, itemsForSubTopics: B, skip: S)
        var request = URLRequest(url: URL(string: reqUrl)!)
        request.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if(error != nil) {
                LOG_ERROR(path: "API/loadData", description: String(describing: error))
                callback(false, [])
                return
            }
            
            if let _response = response as? HTTPURLResponse, let _data = data {
                let statusCode = _response.statusCode
                
                if(statusCode == 200) { //ok!
                    callback(true, self.parse(_data))
                } else {
                    LOG_ERROR(path: "API/loadData", description: "http statusCode \(statusCode)")
                    callback(false, [])
                }
            }
        }
        
        task.resume()
    }
    
    
}


extension API {
    
    func parse(_ data: Data) -> [Topic] {
        
        var result = [Topic]()
        
        do {
            let json = try JSON(data: data)
            for (i, topicJson) in json {
                let index = Int(i)!
                if(index>0) { // First node is always empty
                    let topicInfoJson = topicJson[0]
                    if(self.isTopic(json: topicInfoJson)) {
                        let topic = Topic(json: topicJson)
                        result.append(topic)
                    }
                }
            }
            
        } catch let error {
            print("Error in API/parse: \(String(describing: error))")
        }
        
        return result
        
    }
    
    func isBanner(json: JSON) -> Bool {
        if(json[0].stringValue.uppercased()=="INFO") { return true }
        return false
    }
    
    func isTopic(json: JSON) -> Bool {
        return !self.isBanner(json: json)
    }
    
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
