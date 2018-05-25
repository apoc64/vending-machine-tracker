require 'rails_helper'

describe 'user visits snack show page' do
  it 'shows name, price and locations' do
  # As a user
  sam = Owner.create(name: "Sam's Snacks")
  dons = sam.machines.create(location: "Don's Mixed Drinks")
  turing = sam.machines.create(location: "Turing Basement")

  snack = Snack.create(name: 'snickers', price: 1.75)
  dons.snacks << snack
  turing.snacks << snack
  # When I visit a specific snack page
  visit snack_path(snack)
  # I see the name of that snack
  expect(page).to have_content(snack.name)
  # I see the price for that snack
  expect(page).to have_content(snack.price)
  # I see a list of locations with vending machines that carry that snack
  expect(page).to have_content(dons.location)
  expect(page).to have_content(turing.location)
end
# I see the average price for snacks in those vending machines
# And I see a count of the different kinds of items in that vending machine.
end
