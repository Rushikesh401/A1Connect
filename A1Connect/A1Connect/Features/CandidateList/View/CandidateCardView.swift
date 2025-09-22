//
//  CandidateCardView.swift
//  A1Connect
//
//  Created by Rushikesh Suradkar on 22/09/25.
//

import SwiftUI
import Kingfisher // Make sure you've added this package

struct CandidateCardView: View {
    let candidate: Candidate

    var body: some View {
        HStack(spacing: 16) {
            // MARK: - Profile Image
            KFImage(URL(string: candidate.imageURL))
                .resizable()
                .scaledToFill()
                .frame(width: 80, height: 80)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.pink.opacity(1), lineWidth: 1))

            // MARK: - Candidate Details
            VStack(alignment: .leading, spacing: 6) {
                Text(candidate.name)
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)

                Text(candidate.email)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                HStack {
                    Text("Age: \(candidate.age)")
                    Spacer()
                    Text("DOB: \(candidate.dob)")
                }
                .font(.caption)
                .foregroundColor(.secondary)
            }
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .foregroundColor(.secondary.opacity(0.5))

        }
        .padding()
        .background(Color(.systemBackground)) // Adapts to light/dark mode
        .cornerRadius(16)
        .shadow(color: .black.opacity(0.08), radius: 8, x: 0, y: 4)
    }
}

//MARK: Preview
#Preview {
    CandidateCardView(candidate: Candidate.mock)
}
