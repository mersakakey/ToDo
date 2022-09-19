//
//  ContentView.swift
//  Shared
//
//  Created by Takeru Sakakibara on 2022/05/16.
//

import SwiftUI
import RealmSwift

struct home: View {
    @EnvironmentObject var todoModel: ToDoModel
    @State var selectedTab: TaskStatus
    @State private var isShowingSheet = false
    
    
    var body: some View {
       // Text("test")
       VStack{
        NavigationView{
            VStack(){
                NavigationLink(destination: Todos(selectedTab: .ToDo)) {
                    TodoButton(selectedTab:.ToDo)
                    }
                NavigationLink(destination: Todos(selectedTab: .WantToDo,title:"WantToDo")) {
                        TodoButton(
                            selectedTab:.WantToDo,
                            backColor:Color.orange,title:"WantToDo")
                    }
                
            
            
                HStack{
                    NavigationLink(destination: Todos(selectedTab: .Done,title:"Done")) {
                        DoneButton()
                            .padding()
                    }

                    Button(action: {
                        isShowingSheet = true
                    }) {
                        GeometryReader { geometry in

                            RoundedRectangle(cornerRadius: 40)
                                .fill(Color.red)
                                .opacity(0.8)
                                .overlay(            Text("New")
                                    .font(.system(size: geometry.size.width*0.3, weight: .black, design: .default))
                                    .foregroundColor(.white)
                                )
                        }.aspectRatio(2, contentMode: .fit)
                            .padding()
                    }
                    
                }
         }
            .navigationTitle("ホーム画面")
        }
        .sheet(isPresented: $isShowingSheet, content: {
            let task: Task = .init(name: "", description: "", status: .ToDo, kijitsu:"")
            TaskDetail(task: task)
        })
    }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        home(selectedTab: TaskStatus.WantToDo)
            .environmentObject(ToDoModel())
    }
}
