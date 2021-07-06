# pa-foundation-framework
Planning Analytics (TM1) Foundation Framework

As Planning Analytics TM1 consultants, we've learned to work around a bunch of limitations in the development lifecycle of the IBM Planning Analytics software ecosystem. In fact, we've been doing it so long, we probably don't even realise how bad some of our habits are -- but more and more, clients are starting to notice!

You're probably doing your best to follow best practice, but have you noticed the same questions keep coming up?

- Can you delegate dimension & attribute updates to appropriate end-users or SMEs?
- Do you have an approval process in place to evaluate and accept model changes?
- How do you keep track of versions of model objects and deployment batches ?
- Do you have visibility over who made changes to what model objects and when?
- Can you schedule model migrations overnight (without staying awake till 3am)? 
- Do you still deploy your work by copying files around in the data folder of the TM1 server?
- Do your client-side administrators have enough logging information without digging around in poorly-organised files?
- Is your model consistently-named and easily browsable by an end user?

If any of these questions are difficult to answer, The Planning Analytics Foundation Framework (PAFF) may provide a solution.

PAFF is a build management system for Planning Analytics TM1. It does not prescribe or dictate process -- it merely provides the tools required to implement them in line with your client's needs.

By separating model design from implementation, it encourages standardization, maintainability and auditablility in your modelling, and gives your end-users control over the maintenance and migraton of their own model. 

Features such as in-cube logging, algorithmic generation of subsets, and attribute-based hierarchies ensure consistency and reusability across the entire model, while PAFF also facilitates migration between servers, removing the uncertainty around deploying changes between environments.

It's the framework you probably never realised you needed. 

I'm providing it free and unrestricted to the TM1 community in the hope that it lifts the overall quality of TM1 implementations and keeps our favourite planning application competitive against distruptive new products.
