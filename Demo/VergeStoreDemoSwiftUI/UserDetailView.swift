import Foundation
import SwiftUI
import Verge

struct UserDetailView: View, Equatable {

  var session: Session

  let samples = [
    "cart",
    "manager",
    "illness",
    "agony",
    "ghostwriter",
    "lecture",
    "great",
    "exact",
    "ticket",
    "disappointment",
  ]

  let user: Entity.User

  private var posts: [Entity.Post] {

    session.store.state.primitive.db.entities.post.find(in:
      session.store.state.primitive.db.indexes.postIDsAuthorGrouped.orderedID(in: user.entityID)
    )
  }

  var body: some View {

    VStack {
      Text(user.name)
      Button(action: {
        self.session.sessionDispatcher.submitNewPost(title: self.samples.randomElement()!, from: self.user)
      }) {
        Text("Submit")
      }
      StateReader(session.store).content { (store) in
        List {
          ForEach(self.posts) { post in
            PostView(session: self.session, post: post)
          }
        }
      }
    }
  }
}
