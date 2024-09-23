//
//  PreviewHelpers.swift
//  Cookbook
//
//  Created by Chandler Griffin on 9/22/24.
//

import Foundation

var isPreview: Bool {
    return ProcessInfo.processInfo.environment["XCODE_RUNNING_FOR_PREVIEWS"] == "1"
}
