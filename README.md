## Overtime App

**Key Requirement: ** Company needs documentation that salaried employees did or did not get overtime each week

<ins> Models: </ins> <br>
* POST -> date:date rationale:text
* User -> Devise gem
* AdminUser -> STI (Single Table Inheritance)

<ins> Features: </ins> <br> 
* Approval workflow
* SMS sending -> link to approval or overtime input
* Administrate Admin Dashboard
* Email summary to managers for approval
* Needs to be documented if employee did not log overtime

<ins> UI: </ins> <br>
* Bootstrap -> formatting