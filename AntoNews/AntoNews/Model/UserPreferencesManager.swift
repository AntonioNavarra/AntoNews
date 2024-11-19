//
//  UserPreferencesManager.swift
//  AntoNews
//
//  Created by Antonio Navarra on 13/11/24.
//

import Foundation

class UserPreferencesManager {
    static let shared = UserPreferencesManager()
    
    private let topicsKey = "userTopicsKey"
    
    private let defaults = UserDefaults.standard
    
    
    func savePreferences(topics: [String]) {
        defaults.set(topics, forKey: topicsKey)
    }
    
    func updateTopics(_ topics: [String]) {
        defaults.set(topics, forKey: topicsKey)
    }
    
    func loadPreferences() -> [String] {
        return defaults.array(forKey: topicsKey) as? [String] ?? []
    }
    
}
