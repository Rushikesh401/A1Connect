//
//  CandidateListView.swift
//  A1Connect
//
//  Created by Rushikesh Suradkar on 22/09/25.
//

import SwiftUI

struct CandidateListView: View {
    
    // @State private var candidates: [Candidate] = Candidate.mockData
    @StateObject private var viewModel = CandidateListViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.appBackground.ignoresSafeArea()
                if viewModel.isLoading {
                    ProgressView("Loading Candidates...")
                } else if let errorMessage = viewModel.errorMessage {
                    VStack(spacing: 10) {
                        Text(errorMessage)
                        Button("Retry") {
                            viewModel.fetchData()
                        }
                    }
                } else {
                    VStack(spacing: 0) {
                        HeaderStatsView(
                            showingCount: viewModel.candidates.count,
                            totalCount: viewModel.totalCandidatesCount
                        )
                        
                        List {
                            ForEach(viewModel.candidates) { candidate in
                                CandidateCardView(candidate: candidate)
                                    .listRowInsets(EdgeInsets())
                                    .listRowSeparator(.hidden)
                                    .padding(.vertical, 8)
                                    .onAppear {
                                        print("Data Loading")
                                        if candidate.id == viewModel.candidates.last?.id {
                                            viewModel.loadNextPage()
                                        }
                                    }
                            }
                        }
                        .listStyle(.plain)
                        .refreshable {
                            viewModel.fetchData()
                        }
                    }
                }
            }
            .navigationTitle("Candidates")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
}

// MARK: Preview
#Preview {
    CandidateListView()
}
