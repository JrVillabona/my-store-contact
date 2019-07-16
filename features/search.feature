Feature: Search

In order to can Search items
As an visitor to the page of My Store
I want to search clothes through the searchbox

Scenario Outline: Search clothes successfully

Given I enter a real "<realclothes>" name in the searchbox
When I click the magnifying glass
Then Appears the search results of "<realclothes>"
And The tittle of results have the word "<realclothes>"

Examples:
| realclothes |
| Dress       |
| T-shirt     |
| Summer      |

Scenario Outline: Search clothes unsuccessfully

Given I enter a fail "<fakeclothes>" name in the searchbox
When I click the magnifying glass
Then Appears a warning message "No results were found for your search"

Examples:
| fakeclothes |
| Cake        |
| Smoking     |
| Glass       |

Scenario: Search without enter a word in the searchbox

Given I clear the searchbox to be empty
When I click the magnifying glass
Then Appears a warning message "Please enter a search keyword"