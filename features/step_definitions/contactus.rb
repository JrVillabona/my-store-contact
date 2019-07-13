# frozen_string_literal: true

require 'selenium-cucumber'
require 'selenium-webdriver'

Given('I click the Contact us button') do
  wait_for_element_to_display(:class, 'container', 10)
  click(:id, 'contact-link')
end

And('I complete the contact form') do
  wait_for_element_to_display(:id, 'contact', 10)
  select_option_from_dropdown(:id, :text, 'Customer service', 'id_contact')
  enter_text(:id, $email, 'email')
  enter_text(:id, $orderid, 'id_order')
  enter_text(:name, '/Users/julianvillabona/Downloads/QA Challenge.jpg', 'fileUpload')
  enter_text(:id, $message, 'message')
end

When('I click the Send button') do
  wait_for_element_to_display(:id, 'submitMessage', 10)
  click(:id, 'submitMessage')
end

And('Appears a success message {string}') do |text|
  checktext(:xpath, text, "//p[contains(@class,'alert alert-success')]")
end

And('Appears a fail message {string}') do |text|
  checktext(:xpath, text, "//li[contains(.,'#{text}')]")
end

Then('Appears a {string} description that says {string}') do |num, description|
  checktext(:id, description, "desc_contact#{num}")
end

When('I select {string} like as subject heading') do |subject|
  select_option_from_dropdown(:id, :text, subject, 'id_contact')
end

And('I enter the email') do
  enter_text(:id, $email, 'email')
end

And('I enter the message') do
  enter_text(:id, $message, 'message')
end
