//
//  FileManager-DocDirectory.swift
//  FriendlyContact
//
//  Created by Fauzan Dwi Prasetyo on 18/07/23.
//

import Foundation

extension FileManager {
    static var documentsDirectory: URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        
        return paths[0]
    }
}
