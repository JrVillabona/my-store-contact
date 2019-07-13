# frozen_string_literal: true

require 'selenium-cucumber'
require 'selenium-webdriver'
require 'faker'

module Helpers
  def createcontactuser
    $email = Faker::Internet.free_email
    $orderid = Faker::Number.number(7)
    $message = Faker::Lorem.paragraph_by_chars(256, false)
  end

  def checktext(typeselector, text, selector)
    wait_for_element_to_display(typeselector, selector, 10)
    check_element_text(typeselector, text, selector, true)
  end
end
World(Helpers)
