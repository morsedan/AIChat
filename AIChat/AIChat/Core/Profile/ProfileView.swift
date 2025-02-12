//
//  ProfileView.swift
//  AIChat
//
//  Created by Morse on 1/10/25.
//

import SwiftUI

struct ProfileView: View {
    
    @State private var showSettingsView = false
    @State private var showCreateAvatarView = false
    @State private var currentUser: UserModel? = .mock
    @State private var myAvatars: [AvatarModel] = [] // AvatarModel.mocks
    @State private var isLoading: Bool = true
    @State private var path: [NavigationPathOption] = []
    
    var body: some View {
        NavigationStack(path: $path) {
            List {
                myInfoSection
                myAvatarsSection
            }
            .navigationTitle("Profile")
            .navigationDestinationForCoreModule(path: $path)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    settingsButton
                }
            }
        }
        .sheet(isPresented: $showSettingsView) {
            SettingsView()
        }
        .fullScreenCover(isPresented: $showCreateAvatarView) {
            CreateAvatarView()
        }
        .task {
            await loadData()
            isLoading = false
            myAvatars = AvatarModel.mocks
        }
    }
    
    private func loadData() async {
        try? await Task.sleep(for: .seconds(5))
        
    }
    
    private var settingsButton: some View {
        Image(systemName: "gear")
            .font(.headline)
            .foregroundStyle(.accent)
            .anyButton {
                onSettingsButtonTap()
            }
    }
    
    private var myInfoSection: some View {
        Section {
            ZStack {
                Circle()
                    .fill(currentUser?.profileColorCalculated ?? .accent)
            }
            .frame(width: 100, height: 100)
            .frame(maxWidth: .infinity)
            .removeListRowFormatting()
        }
    }
    
    private var myAvatarsSection: some View {
        Section {
            if myAvatars.isEmpty {
                Group {
                    if isLoading {
                        ProgressView()
                    } else {
                        Text("Tap + to create an avatar.")
                    }
                }
                .padding(50)
                .frame(maxWidth: .infinity)
                .font(.body)
                .foregroundStyle(.secondary)
                .removeListRowFormatting()
            } else {
                ForEach(myAvatars, id: \.self) { avatar in
                    CustomListCellView(
                        imageName: avatar.profileImageName,
                        title: avatar.name,
                        subtitle: nil
                    )
                    .anyButton(.highlight, action: {
                        onAvatarTap(avatar)
                    })
                    .removeListRowFormatting()
                }
                .onDelete { indexSet in
                    onDeleteAvatar(indexSet: indexSet)
                }
            }
        } header: {
            HStack(spacing: 0) {
                Text("My avatars")
                Spacer()
                Image(systemName: "plus.circle.fill")
                    .font(.title)
                    .foregroundStyle(.accent)
                    .anyButton {
                        onNewAvatarButtonTap()
                    }
            }
        }
    }
    
    private func onSettingsButtonTap() {
        showSettingsView = true
    }
    
    private func onNewAvatarButtonTap() {
        showCreateAvatarView = true
    }
    
    private func onAvatarTap(_ avatar: AvatarModel) {
        path.append(.chat(avatarId: avatar.avatarID))
    }
    
    private func onDeleteAvatar(indexSet: IndexSet) {
        guard let index = indexSet.first else { return }
        
        myAvatars.remove(at: index)
    }
}

#Preview {
    ProfileView()
        .environment(AppState())
}
