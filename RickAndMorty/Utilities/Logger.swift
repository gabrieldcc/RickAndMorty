//
//  Logger.swift
//  RickAndMorty
//
//  Created by Gabriel de Castro Chaves on 19/02/23.
//

final class Logger {
    static func log(
        _ message: String,
        file: String = #file,
        line: Int = #line,
        function: String = #function
    ) {
        print("Message -> \(message)")
        print("File -> \(file)")
        print("Line -> \(line)")
        print("Function -> \(function)")
    }
}
