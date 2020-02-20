//
//  APIWorker.swift
//  GORA-CandidacyTask
//
//  Created by Eugene Ilyin on 19.02.2020.
//  Copyright © 2020 Eugene Ilyin. All rights reserved.
//

import Foundation

class APIWorker {
    
    // MARK: - Properties
    private let dispatchQueue = DispatchQueue(label: "un0dvend1g.GORA-CandidacyTask.gcd.utilityQueue",
                                              qos: .utility,
                                              attributes: .concurrent)
    private let semaphore = DispatchSemaphore(value: 0)
    static let shared = APIWorker()
    private let urlSession = URLSession.shared
    
    // MARK: - Type aliases
    typealias FetchDataResult = (Data?, URLResponse?, Error?) -> Void
    
    // MARK: - Initialization
    private init() {}
    
    // MARK: - Methods
    func fetchData(from url: URL, completion: @escaping FetchDataResult) {
        dispatchQueue.async {
            [unowned self] in
            self.urlSession.dataTask(with: url) { (data, response, error) in
                completion(data, response, error)
                self.semaphore.signal()
            }.resume()
            _ = self.semaphore.wait(wallTimeout: .distantFuture)
        }
    }
}
