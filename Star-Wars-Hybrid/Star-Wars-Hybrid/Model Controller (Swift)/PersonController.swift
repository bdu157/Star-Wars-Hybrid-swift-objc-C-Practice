//
//  PersonController.swift
//  Star-Wars-Hybrid
//
//  Created by Dongwoo Pae on 11/13/19.
//  Copyright © 2019 Lambda, Inc. All rights reserved.
//

import Foundation

@objc (LSIPersonController)
class PersonController: NSObject {
    
    private let baseURL = URL(string: "https://swapi.co/api/people")!
    
    @objc(sharedController)
    static let shared = PersonController()
    
    @objc(searchForPeopleWithSearchTerm:completionHandler:)
    func searchForPeople(with searchTerm: String, completion: @escaping ([Person]?, Error?) -> Void) {
        
        var components = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)!
        let searchItem = URLQueryItem(name: "search", value: searchTerm)
        components.queryItems = [searchItem]
        let url = components.url!
    
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error {
                DispatchQueue.main.async {
                    completion(nil, error)
                }
                return
            }
            
            guard let data = data else {
                DispatchQueue.main.async {
                    completion(nil, NSError(domain: "PersonControllerErrorDomain", code: 0, userInfo: nil))
                }
                return
            }
            
            do {
                guard let dictionary = try JSONSerialization.jsonObject(with: data, options: []) as? [String : Any] else {
                    let error = NSError(domain: "PersonControllerErrorDomain", code: 1, userInfo: nil);
                    
                    throw error
                }
                
                guard let personDictionaries = dictionary["results"] as? [[String : Any]] else {
                    let error = NSError(domain: "PersonControllerErrorDomain", code: 2, userInfo: nil);
                    
                    throw error
                }
                
                let people = personDictionaries.compactMap { Person(dictionary: $0) }
                
                DispatchQueue.main.async {
                    // self.people = people
                    completion(people, nil)
                }
            } catch {
                DispatchQueue.main.async {
                    completion(nil, error)
                }
            }
        }.resume()
        
    }
}
