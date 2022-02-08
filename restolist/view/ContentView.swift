//
//  ContentView.swift
//  restolist
//
//  Created by Akashaka on 07/02/22.
//

import SwiftUI
import NetworkImage
import CTRating

struct ContentView: View {
    @ObservedObject var restoListController: RestoListController
    var body: some View {
        NavigationView{
            if let restaurants=restoListController.data?.restaurants{
                List(
                    restaurants ,id:\.id
                ){item in
                    
                    NavigationLink(destination:DetailView(restaurantId:item.id,controller: RestoDetailController()),label :{RowItem(title: item.name ,desc: item.restaurantDescription, city: item.city , urlImage: "https://restaurant-api.dicoding.dev/images/medium/"+item.pictureID, rating: Int(item.rating))
                        
                    })
                }.navigationTitle("My Resto").navigationBarTitleDisplayMode(.inline).toolbar{
                    ToolbarItem(placement:.navigationBarTrailing){
                        NavigationLink(destination: AboutPageView(),label: {
                            HStack{
                                Image(systemName: "info.circle").imageScale(.medium)
                                Text("About")
                            }
                            
                        }
                        ).navigationTitle("back")
                    }
                }
                
            }else{
                Text("Fetching failed")
            }
            
        }.padding(0).onAppear(perform: restoListController.fetchItems)
        
    }
}
private struct RowItem: View{
    var title,desc,city,urlImage:String
    @State var rating:Int
    var body: some View {
        VStack(alignment:.leading){
            HStack(spacing: 15) {
                NetworkImage(url: URL(string: urlImage)) { image in
                    image.resizable()          } placeholder: {
                        ProgressView() // Shown while the image is loaded
                    } fallback: {
                        Image(systemName: "photo") // Shown when an error occurs or the URL is nil
                    }
                    .frame(width: 75, height: 75)
                    .clipped()
                    .background(Color.white).cornerRadius(10)
                VStack(alignment:.leading){
                    Text(title)
                    Text(city)
                    CTRating(maxRating: 5,currentRating:$rating).disabled(true)
                }
            }
            Text(desc).lineLimit(3)
            
        }.padding()
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(restoListController: RestoListController())
    }
}
