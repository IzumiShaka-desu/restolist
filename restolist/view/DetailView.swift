//
//  DetailView.swift
//  restolist
//
//  Created by Akashaka on 08/02/22.
//

import SwiftUI
import NetworkImage
import CTRating

struct DetailView: View {
    var restaurantId:String
    @ObservedObject var controller: RestoDetailController
    var body: some View {
        VStack{
            if let restaurant=controller.data?.restaurant{
                PageBody(
                    title: restaurant.name, desc: restaurant.restaurantDescription, city: restaurant.city, address: restaurant.address, urlImage:   "https://restaurant-api.dicoding.dev/images/medium/"+restaurant.pictureID, rating: Int(restaurant.rating),drinks:restaurant.menus.drinks ?? [], foods:restaurant.menus.foods ?? [],
                    reviews: restaurant.customerReviews)
                
            } else{
                Text(" data not Loaded")
            }
            
        }.onAppear{
            controller.fetchItem(restaurantId)
            
        }
        
    }
}

private struct PageBody: View{
    var title,desc,city,address,urlImage:String
    @State var rating:Int
    var drinks,foods:[Category]
    var reviews:[CustomerReview]
    var body: some View{
        ZStack{
            VStack(){
                HStack(spacing: 15) {
                    NetworkImage(url: URL(string:urlImage)) { image in
                        image.resizable()
                        
                    } placeholder: {
                        ProgressView()
                        
                    } fallback: {
                        Image(systemName: "photo")
                        
                    }
                    .frame(width: 150, height: 150)
                    .clipped()
                    .background(Color.white).cornerRadius(10)
                    VStack(alignment:.leading){
                        Text(title).font(.title)
                        Text(city+", "+address).font(.subheadline)
                        CTRating(maxRating: 5,currentRating:$rating).disabled(true)                    }
                    
                    
                }
                TabView{
                    DescriptionView(desc: desc,drinks: drinks,foods: foods).tabItem {
                        Label("Description",systemImage: "info.circle")
                    }
                    
                    ReviewPageView(reviews: reviews).tabItem {
                        Label("Reviews",systemImage: "rectangle.and.pencil.and.ellipsis")
                    }
                }
            }.padding()
        }.frame(width: .infinity,alignment: .topLeading)
        
    }
}
private struct ReviewPageView: View{
    var reviews:[CustomerReview]
    var body: some View{
        VStack{
            HStack(){
                Text("Review").fontWeight(.bold).font(.title2)
                Spacer()
            }
            VStack{
                List(reviews,id:\.review){review in
                    VStack(alignment:.leading){
                        HStack{
                            Text(review.name ?? "").font(.title3)
                            Spacer()
                            Text(review.date ?? "").font(.footnote)
                        }.padding(8)
                        Text(review.review ?? "").font(.body)
                    }.padding(8)
                    
                }
                
            }
            
            
        }
    }
}
private struct DescriptionView: View{
    var desc:String
    var drinks,foods:[Category]
    var body: some View{
        
        ScrollView{
            VStack{
                HStack(){
                    Text("Description").fontWeight(.bold).font(.title2)
                    Spacer()
                }
                
                Text(desc )
                HStack(){
                    Text("Menu").fontWeight(.bold).font(.headline)
                    Spacer()
                }
                HStack(){
                    Text("Drinks").fontWeight(.bold).font(.subheadline)
                    Spacer()
                }
                ScrollView(.horizontal,showsIndicators: false){
                    LazyHStack{
                        ForEach(drinks,id:\.name){drink in
                            
                            Label(drink.name ?? "",systemImage:"0.circle.fill")
                            
                        }
                    }
                }.frame(height:30)
                
                HStack(){
                    Text("Foods").fontWeight(.bold).font(.subheadline)
                    Spacer()
                }
                ScrollView(.horizontal,showsIndicators: false){
                    LazyHStack{
                        ForEach(foods,id:\.name){food in
                            Label(food.name ?? "",systemImage:"0.circle.fill")
                            
                        }
                    }
                }.frame(height:30)
            }
        }.frame(width: .infinity)
        
    }
}
struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(restaurantId: "1",controller: RestoDetailController())
    }
}
