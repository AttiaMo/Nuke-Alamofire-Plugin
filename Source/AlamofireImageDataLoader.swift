// The MIT License (MIT)
//
// Copyright (c) 2015 Alexander Grebenyuk (github.com/kean).

import Foundation
import Alamofire
import Nuke

public class AlamofireImageDataLoader: ImageDataLoading {
    public let manager: Alamofire.Manager
    
    public init(manager: Alamofire.Manager = Alamofire.Manager.sharedInstance) {
        self.manager = manager
    }
    
    // MARK: ImageDataLoading
        
    public func imageDataTaskWithRequest(request: ImageRequest, progressHandler: ImageDataLoadingProgressHandler, completionHandler: ImageDataLoadingCompletionHandler) -> NSURLSessionTask {
        let task = self.manager.request(request.URLRequest).response { (_, response, data, error) -> Void in
            completionHandler(data: data, response: response, error: error)
        }.progress { (_, totalBytesReceived, totalBytesExpected) -> Void in
            progressHandler(completedUnitCount: totalBytesReceived, totalUnitCount: totalBytesExpected)
        }
        return task.task
    }
    
    public func invalidate() {
        self.manager.session.invalidateAndCancel()
    }
    
    public func removeAllCachedImages() {
        self.manager.session.configuration.URLCache?.removeAllCachedResponses()
    }
}
