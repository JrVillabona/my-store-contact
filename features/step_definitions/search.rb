# frozen_string_literal: true

require 'selenium-cucumber'
require 'selenium-webdriver'

Given('I enter a fail {string} name in the searchbox') do |fakeclothes|
  enter_text(:name, fakeclothes, 'search_query')
end

Given('I enter a real {string} name in the searchbox') do |realclothes|
  enter_text(:name, realclothes, 'search_query')
end

When('I click the magnifying glass') do
  click(:name, 'submit_search')
end

Then('Appears a warning message {string}') do |warning|
  check_element_partial_text(:xpath, warning, "//p[contains(@class,'alert alert-warning')]", true)
  check_element_text(:xpath, '0 results have been found.', "//span[contains(@class,'heading-counter')]", true)
end

Then('Appears the search results of {string}') do |realclothes|
  wait_for_element_to_display(:id, 'center_column', 10)
  check_element_partial_text(:id, realclothes, 'center_column', true)
  check_element_text(:xpath, '0 results have been found.', "//span[contains(@class,'heading-counter')]", false)
end
