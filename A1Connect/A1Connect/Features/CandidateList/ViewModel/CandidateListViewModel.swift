//
//  CandidateListViewModel.swift
//  A1Connect
//
//  Created by Rushikesh Suradkar on 22/09/25.
//

import Foundation

@MainActor
class CandidateListViewModel: ObservableObject {
    // MARK: - Published Properties
    @Published var candidates: [Candidate] = []
    @Published var isLoading = true
    @Published var errorMessage: String?
    
    // MARK: - Private Properties for Pagination Logic
    private var allCandidates: [Candidate] = []
    private var currentPage = 0
    private let pageSize = 10
    var totalCandidatesCount: Int { allCandidates.count }

    init() {
       
        fetchData()
    }

    func fetchData() {
        isLoading = true
        errorMessage = nil
        
        Task {
            do {
                allCandidates = try await NetworkService.shared.fetchAllCandidates()
                
                currentPage = 0
                candidates = []
                loadNextPage()
                
            } catch {
                errorMessage = "Failed to load candidates. Please try again."
            }
            
            isLoading = false
        }
    }

    func loadNextPage() {
        let startIndex = currentPage * pageSize
        guard startIndex < allCandidates.count else { return } // No more items to load

        let endIndex = min(startIndex + pageSize, allCandidates.count)
        let nextPage = Array(allCandidates[startIndex..<endIndex])
        
        candidates.append(contentsOf: nextPage)
        currentPage += 1
    }
}
