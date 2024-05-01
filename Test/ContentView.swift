//
//  ContentView.swift
//  WalletTest
//
//  Created by Thang Ho Duc on 01/05/2024.
//

import SwiftUI
import SwiftData
struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]

    var body: some View {
        VStack {
            Button(action:createWallet) {
                Text("Create wallet")
            }
        }
    }
    
    public func createWallet(){
        let plg = AwesomeLibrary();
        let mnemonic = "bacon grit piece velvet shallow mail hidden obey visa copy race certain"
        
        let path = "44'/60'/0'/0/0"
        
        let rs: String = plg.hdkey(mnemonicString: mnemonic, path: path).self
      
        let address = rs.split(separator: " ")[0]
        
        print("address : ", address)
        
        let publicKey = rs.split(separator: " ")[1]
        print("publicKey : ", publicKey)
        let privateKey = rs.split(separator: " ")[2]
        print("privateKey: ", privateKey)
    }

    private func addItem() {
        withAnimation {
            let newItem = Item(timestamp: Date())
            modelContext.insert(newItem)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(items[index])
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
