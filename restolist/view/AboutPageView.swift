//
//  AboutPageView.swift
//  restolist
//
//  Created by Akashaka on 08/02/22.
//

import SwiftUI
import NetworkImage

struct AboutPageView: View {
    
    var body: some View {
        NavigationView{
            VStack(){
                Spacer()
                let _imageUrl="https://media.discordapp.net/attachments/916984491363409930/940466191166763048/2021042706272366ec78fe14a65eb49c3476fae33ec75b.png"
                NetworkImage(url: URL(string: _imageUrl)) { image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                } fallback: {
                    Image(systemName: "photo")                     }
                .frame(width: 150, height: 150)
                .clipped()
                .background(Color.white).cornerRadius(10)
                Text("Sesaka Aji Nursyah Bantani")
                Text("Mobile Developer")
                Spacer()
                Spacer()
                Spacer()
                Spacer()
            }.navigationTitle("About").navigationBarTitleDisplayMode(.inline).toolbar{
            }
        }.padding(0)
        
    }
}

struct AboutPageView_Previews: PreviewProvider {
    static var previews: some View {
        AboutPageView()
    }
}
