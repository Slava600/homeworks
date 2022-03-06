


import Foundation


struct Post {
    var author: String
    var description: String
    var image: String
    var likes: Int
    var views: Int
}

let postsArray = [
    Post(author: "Автор 1", description: "Описание 1", image: "post1", likes: 1, views: 1),
    Post(author: "Автор 2", description: "Описание 2", image: "post2", likes: 2, views: 2),
    Post(author: "Автор 3", description: "Описание 3", image: "post3", likes: 3, views: 3),
    Post(author: "Автор 4", description: "Описание 4", image: "post4", likes: 4, views: 4)
]
