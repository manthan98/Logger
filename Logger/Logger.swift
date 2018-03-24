//
//  Logger.swift
//  Logger
//
//  Created by Manthan Shah on 2018-03-23.
//  Copyright © 2018 Manthan Shah. All rights reserved.
//

import UIKit

public enum LogEvent: String {
    
    case e = "ERROR"
    case i = "INFO"
    case d = "DEBUG"
    case v = "VERBOSE"
    case w = "WARNING"
    case s = "SEVERE"
    
}

open class Logger: NSObject {
    
    static var dateFormat = "yyyy-MM-dd hh:mm:ssSS"
    static var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = dateFormat
        formatter.locale = Locale.current
        formatter.timeZone = TimeZone.current
        return formatter
    }
    
    private class func sourceFileName(filePath: String) -> String {
        let components = filePath.components(separatedBy: "/")
        return components.isEmpty ? "" : (components.last ?? "error")
    }
    
    open class func log(message: String,
                        event: LogEvent,
                        fileName: String = #file,
                        line: Int = #line,
                        column: Int = #column,
                        funcName: String = #function) {
        #if DEBUG
            
            print("\(Date().toString()) \(event.rawValue):[\(sourceFileName(filePath: fileName))]:\(line) \(column) \(funcName) -> \(message)")
        
        #endif
    }

}

extension Date {
    func toString() -> String {
        return Logger.dateFormatter.string(from: self as Date)
    }
}
