//
//  LocalFileManager.swift
//  FriendlyContact
//
//  Created by Fauzan Dwi Prasetyo on 18/07/23.
//

import Foundation

class ImageUtils {
    
    func setImage(imageData: Data) -> String? {
        let url = FileManager.documentsDirectory.appendingPathComponent(UUID().uuidString)
        
        do {
            try imageData.write(to: url, options: [.atomic, .completeFileProtection])
            return url.lastPathComponent
        } catch {
            print("Failed write image data to disk: \(error.localizedDescription)")
        }
        
        return nil
    }
    
    func getImage(imagePath: String?) -> Data?{
        guard let imagePath = imagePath else { return nil }
        
        let url = FileManager.documentsDirectory.appendingPathComponent(imagePath)
        if let data = try? Data(contentsOf: url) {
            return data
        }
        
        return nil
    }
    
    func deleteImage(imagePath: String?) {
        guard let imagePath = imagePath else { return }
        
        let url = FileManager.documentsDirectory.appendingPathComponent(imagePath)
        
        do {
            try FileManager.default.removeItem(at: url)
        } catch {
            fatalError("Failed to delete image from \(url): \(error.localizedDescription)")
        }
    }
}
