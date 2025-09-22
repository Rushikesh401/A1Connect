//
//  NetworkService.swift
//  A1Connect
//
//  Created by Rushikesh Suradkar on 22/09/25.
//

import Foundation

struct CandidateResponse: Codable {
    let data: [Candidate]
}

class NetworkService {
    static let shared = NetworkService()
    
    private let apiURL = URL(string: "https://core-apis.a1apps.co/ios/interview-details")!
    
    private init() {}
    
    func fetchAllCandidates() async throws -> [Candidate] {
        do {
            let (data, _) = try await URLSession.shared.data(from: apiURL)
            
            let decoder = JSONDecoder()
            let response = try decoder.decode(CandidateResponse.self, from: data)
            
            return response.data
        } catch {
            print("Error fetching or decoding data: \(error)")
            throw error
        }
    }
}
