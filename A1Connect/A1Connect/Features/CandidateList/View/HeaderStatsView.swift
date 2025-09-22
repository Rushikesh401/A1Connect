//
//  HeaderStatsView.swift
//  A1Connect
//
//  Created by Rushikesh Suradkar on 22/09/25.
//

import SwiftUI

struct HeaderStatsView: View {
    let showingCount: Int
    let totalCount: Int

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("OVERVIEW")
                .font(.footnote)
                .fontWeight(.medium)
                .foregroundColor(.secondary)
            
            HStack {
                Text("**\(showingCount)** of **\(totalCount)** candidates")
                    .font(.title2)
                    .fontWeight(.bold)
                
                Spacer()
            }
        }
        .padding(.horizontal)
        .padding(.bottom, 8)
    }
}


#Preview {
    HeaderStatsView(showingCount: 15, totalCount: 250)
}
