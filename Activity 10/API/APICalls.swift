//
//  APICalls.swift
//  Activity 10 Solution
//
//  Created by Dania A on 13/11/2018.
//  Copyright © 2018 Udacity. All rights reserved.
//

import Foundation

class APICalls {
    
    static func login (_ username : String!, _ password : String!, completion: @escaping (Bool, String, Error?)->()) {
        
        var request = URLRequest(url: URL(string: "https://onthemap-api.udacity.com/v1/session")!)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = "{\"udacity\": {\"username\": \"\(username!)\", \"password\": \"\(password!)\"}}".data(using: .utf8)
        let session = URLSession.shared
        
        let task = session.dataTask(with: request) { data, response, error in
            if error != nil {
                // TODO: Call the completion handler and send the error so it can be handled on the UI, also call "return" so the code next to this block won't be executed
                completion(false, "", error)
            }
            
            //Get the status code to check if the response is OK or not
            guard let statusCode = (response as? HTTPURLResponse)?.statusCode else {
                
                // TODO: Call the completion handler and send the error so it can be handled on the UI, also call "return" so the code next to this block won't be executed (you need to call return in let guard's else body anyway)
                completion(false, "", error)
                return
            }
            
            if statusCode >= 200  && statusCode < 300 {
                
                //Skipping the first 5 characters
                let range = Range(5..<data!.count)
                let newData = data?.subdata(in: range) /* subset response data! */
                
                //Print the data to see it and know you'll parse it (this can be removed after you complete building the app)
                debugPrint(String(data: newData!, encoding: .utf8)!)
                
                //TODO: Initialize a JSONDecoder object
                
                //TODO: Convert the newData! to a User.self object
                do {
                    
                    //TODO: Get the unique key of the user and save it locally for later
                    
                } catch {
                    debugPrint(error)
                    completion (false, "nil", nil)
                }
                
            } else {
                //TODO: call the completion handler properly
            }
        }
        //Start the task
        task.resume()
    }
    
    static func getAllLocations (completion: @escaping ([StudentLocation]?, Error?) -> ()) {
        var request = URLRequest (url: URL (string: "https://onthemap-api.udacity.com/v1/StudentLocation?limit=100&order=-updatedAt")!)
        
        request.addValue("QrX47CA9cyuGewLdsL7o5Eb8iug6Em8ye0dnAbIr", forHTTPHeaderField: "X-Parse-Application-Id")
        
        request.addValue("QuWThTdiRmTux3YaDseUSEpUKo7aBYM737yKd4gY", forHTTPHeaderField: "X-Parse-REST-API-Key")
        
        let session = URLSession.shared
        let task = session.dataTask(with: request) {data, response, error in
            if error != nil {
                // TODO: Call the completion handler and send the error so it can be handled on the UI, also call "return" so the code next to this block won't be executed
                completion(nil, error)
            }
            
            //Print the data to see it and know you'll parse it (this can be removed after you complete building the app)
            debugPrint(String(data: data!, encoding: .utf8)!)
            
            guard let statusCode = (response as? HTTPURLResponse)?.statusCode else {
                // TODO: Call the completion handler and send the error so it can be handled on the UI, also call "return" so the code next to this block won't be executed (you need to call return in let guard's else body anyway)
                completion(nil, error)
                return
            }
            
            if statusCode >= 200 && statusCode < 300 {
                
                //Get an object based on the received data in JSON format
                let decoder = JSONDecoder()
                
                //TODO: Convert data to an object inside do,catch (you should create a model that holds an array of [StudentLocation])
                
            }
        }
        
        task.resume()
    }
}
