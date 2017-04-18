//
//  FileUtils.swift
//  GESCoreDataProject
//
//  Created by Maeva Malih on 18/04/2017.
//  Copyright © 2017 Maeva. All rights reserved.
//

import UIKit
import CoreData

class FileUtils: NSObject {
    
    class func getDocumentDirectory() -> URL {
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return urls[0]
        
    }
    class func getDocumentFile(at path: String) -> URL {
        let parent = self.getDocumentDirectory()
        return parent.appendingPathComponent(path)
        
    }

}
