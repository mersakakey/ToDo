//
//  TaskDetaikl.swift
//  toDo
//
//  Created by Takeru Sakakibara on 2022/06/06.
//

import SwiftUI

struct TaskDetail: View {
    @EnvironmentObject var todoModel: ToDoModel
    @State var task: Task
    var taskIndex: Int {
        if let taskIndex = todoModel.taskList.firstIndex(where: { $0.id == task.id }) {
            return taskIndex
        } else {
            return todoModel.taskList.count + 1
        }
    }
    
    var body: some View {
        VStack {
            HStack {
                
                if taskIndex > todoModel.taskList.count {
                  back()
                    
                    Spacer()
                    
                    RegistTaskButton(todoList: $todoModel.taskList, task: task)
                } else {
                    Spacer()
                    DeleteTaskButton(beforeValueTask: $todoModel.taskList[taskIndex])
                    UpdateTaskButton(beforeValueTask: $todoModel.taskList[taskIndex], afterValueTask: task)
                }

            }
            
           TaskStatusTabBar(selectedTab: $task.status)
            

            HStack {
                
                Text("タスク名")
                    .padding(.leading)
                    .padding(.top)
                Spacer()
            }
            TextField("タスク名", text: $task.name)
                .frame(width: UIScreen.main.bounds.size.width - 50, height: 40)
                .font(.system(size: 19, weight: .bold))
                .padding(.horizontal)
                .padding(.bottom, 5)
                .background(Color.white)
            
            HStack {
                Text("内容")
                    .padding(.leading)
                    .padding(.top)
                Spacer()
            }
            TextField("タスクの説明", text: $task.description)
                .frame(width: UIScreen.main.bounds.size.width - 50, height: 80)
                .font(.system(size: 17, weight: .regular))
                .padding(.horizontal)
                .padding(.bottom, 5)
                .background(Color.white)
            
            HStack {
                
                Text("期日")
                    .padding(.leading)
                    .padding(.top)
                Spacer()
            }
            TextField("期日", text: $task.kijitsu)
                .frame(width: UIScreen.main.bounds.size.width - 50, height: 40)
                .font(.system(size: 19, weight: .bold))
                .padding(.horizontal)
                .padding(.bottom, 5)
                .background(Color.white)
            
            Spacer()
            
            
        }
        .navigationBarTitleDisplayMode(.inline)
        .background(Color(.white))
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct TaskDetail_Previews: PreviewProvider {
    static var previews: some View {
        TaskDetail(task: .init(name: "〜する", description: "あああああああああ", status: .WantToDo, kijitsu :"6月4日"))
            .environmentObject(ToDoModel())
    }
}
