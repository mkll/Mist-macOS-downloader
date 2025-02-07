//
//  MistError.swift
//  Mist
//
//  Created by Nindi Gill on 17/6/2022.
//

import Foundation

enum MistError: Error, Equatable {
    case generalError(_ string: String)
    case chunklistValidationError(_ string: String)
    case fileSizeAttributesError(_ url: URL)
    case invalidData
    case invalidDestinationURL
    case invalidDownloadResumeData
    case invalidFileSize(invalid: UInt64, valid: UInt64)
    case invalidShasum(invalid: String, valid: String)
    case invalidTerminationStatus(status: Int32, output: String?, error: String?)
    case invalidURL(_ url: String)
    case maximumRetriesReached
    case missingDevicesKey
    case missingFileAttributes
    case outputStreamBufferError
    case outputStreamWriteError
    case userCancelled

    var description: String {
        switch self {
        case let .generalError(string):
            return "Error: \(string)"
        case let .chunklistValidationError(string):
            return "Chunklist validation failed: \(string)"
        case let .fileSizeAttributesError(url):
            return "Unble to retrieve file size from file '\(url.path)'"
        case .invalidData:
            return "Invalid data"
        case .invalidDestinationURL:
            return "Invalid destination URL"
        case .invalidDownloadResumeData:
            return "Invalid download resume data"
        case let .invalidFileSize(invalid, valid):
            return "Invalid File Size: '\(invalid)', should be: '\(valid)'"
        case let .invalidShasum(invalid, valid):
            return "Invalid Shasum: '\(invalid)', should be: '\(valid)'"
        case let .invalidTerminationStatus(status, output, error):
            var string: String = "Invalid Termination Status: \(status)"

            if
                let output: String = output,
                !output.isEmpty {
                string += "\n\n\(output)"
            }

            if
                let error: String = error,
                !error.isEmpty {
                string += "\n\n\(error)"
            }

            return string
        case let .invalidURL(url):
            return "Invalid URL: '\(url)'"
        case .maximumRetriesReached:
            return "Maximum number of retries reached"
        case .missingDevicesKey:
            return "Missing 'devices' key"
        case .missingFileAttributes:
            return "Missing file attributes"
        case .outputStreamBufferError:
            return "Output Stream Buffer Error"
        case .outputStreamWriteError:
            return "Output Stream Write Error"
        case .userCancelled:
            return "User cancelled"
        }
    }
}
