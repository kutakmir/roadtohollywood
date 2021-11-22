//
//  GoogleDrivePermissionScope.swift
//  Road to Hollywood
//
//  Created by Miroslav Kutak on 20/11/21.
//

import Foundation

enum GooglePermissionScope: String {
    case drive = "drive" //    See, edit, create, and delete all of your Google Drive files
    case driveAppdata = "drive.appdata" //    View and manage its own configuration data in your Google Drive
    case driveFile = "drive.file" //    View and manage Google Drive files and folders that you have opened or created with this app
    case driveMetadata = "drive.metadata" //    View and manage metadata of files in your Google Drive
    case driveMetadataReadonly = "drive.metadata.readonly" //    View metadata for files in your Google Drive
    case drivePhotosReadonly = "drive.photos.readonly" //    View the photos, videos and albums in your Google Photos
    case driveReadonly = "drive.readonly" //    See and download all your Google Drive files
    case driveScripts = "drive.scripts" //
}
//https://www.googleapis.com/auth/drive    See, edit, create, and delete all of your Google Drive files
//https://www.googleapis.com/auth/drive.appdata    View and manage its own configuration data in your Google Drive
//https://www.googleapis.com/auth/drive.file    View and manage Google Drive files and folders that you have opened or created with this app
//https://www.googleapis.com/auth/drive.metadata    View and manage metadata of files in your Google Drive
//https://www.googleapis.com/auth/drive.metadata.readonly    View metadata for files in your Google Drive
//https://www.googleapis.com/auth/drive.photos.readonly    View the photos, videos and albums in your Google Photos
//https://www.googleapis.com/auth/drive.readonly    See and download all your Google Drive files
//https://www.googleapis.com/auth/drive.scripts
