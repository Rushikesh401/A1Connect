//
//  CandidateListView.swift
//  A1Connect
//
//  Created by Rushikesh Suradkar on 22/09/25.
//

import SwiftUI

struct CandidateListView: View {
    
    @State private var candidates: [Candidate] = Candidate.mockData
    
    var body: some View {
        NavigationView {
            List {
                ForEach(candidates) { candidate in
                    CandidateCardView(candidate: candidate)
                        .listRowSeparator(.hidden)
                        .padding(.vertical, 8)
                }
            }
            .listStyle(.plain)
            .navigationTitle("Candidates")
            .navigationBarTitleDisplayMode(.automatic)
        }
    }
}

// MARK: Preview
#Preview {
    CandidateListView()
}
