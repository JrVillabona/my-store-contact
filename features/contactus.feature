Feature: Contact us

In order to can contact the customer service
As an visitor to the page of My Store
I want to send a message to the customer service

Scenario: Fill out the contact form to contact the customer service
Given I click the Contact us button
And I complete the contact form
When I click the Send button
Then Appears a success message "Your message has been successfully sent to our team."

Scenario: The contact form doesn't send if the textfields is empty        
Given I click the Contact us button
When I click the Send button
Then Appears a fail message "Invalid email address."

Scenario: The contact form doesn't send if only send the textfields email
Given I click the Contact us button
And I enter the email
When I click the Send button
Then Appears a fail message "The message cannot be blank."

Scenario: The contact form doesn't send if only enter the textfields email and message
Given I click the Contact us button
And I enter the email
And I enter the message
When I click the Send button
Then Appears a fail message "Please select a subject from the list provided."

Scenario Outline: The Subject Heading description
Given I click the Contact us button
When I select "<subject>" like as subject heading
Then Appears a "<num>" description that says "<description>"

Examples:
    | num | subject          | description                                   |
    | 1   | Webmaster        | If a technical problem occurs on this website |
    | 2   | Customer service | For any question about a product, an order    |