### Architecture

Good system design starts with good requirements. Well-defined requirements make it easy to design your system and increase the chance of building better software. Most problems occur when certain (bad) assumptions are made due to bad communication with other team members. 

The goal of good software design is to balance the trade-offs of solving the current problems while welcoming changes. Software, as the name implies, should be *soft*.

*"A good architecture is a form of good communication."*

**BDD**
Behavior-driven development* is a nice way of gathering relevant information via conversations. It encourages team to use conversation and concrete examples to formalize a shared understanding of how an application should behave. The biggest problem is when a developer sees a requirement and are afraid to ask a question.

Non BDD:
>   **Story**
>   As a user
>   I want the app to load the feed 
>   So I can see the feed

>   **Acceptance criteria**
>   Given a user
>   When the user opens the feed 
>   Then the feed is displayed 

BDD:
> **Story 1**
> As an online customer 
> I want the app to automatically load my latest image feed 
> So I can always enjoy the newest images of my friends

> **Acceptance criteria**
> Given the customer has connectivity 
> When the customer requests to see the feed
> Then the app should display the latest feed from remote
> And replace the cache with the new feed

> **Story 2**
> As an offline customer
> I want the app to show the latest saved version of my image feed
> So I can always enjoy images of my friends

> **Acceptance criteria**
> Given the customer doesn't have connectivity
> And there’s a cached version of the feed
> When the customer requests to see the feed
> Then the app should display the latest feed saved
> **BUT IF**
> Given the customer doesn't have connectivity
> And the cache is empty
> When the customer requests to see the feed
> Then the app should display an error message

\
**Use Cases**
Provides an algorithmic view to the requirements. Can be used alongside BDD to better understand the features of the app. It looks like a recipe that is easy to follow and easy to translate to code.

*Load Feed Use Case*

Data (Input):
- URL

Primary course (happy path):
1. Execute "Load Feed Items" command with above data.
2. System downloads data from the URL.
3. System validates downloaded data.
4. System creates feed items from valid data.
5. System delivers feed items.
   
Invalid data – error course (sad path):
- System delivers error.

No connectivity – error course (sad path):
- System delivers error.


