require 'rails_helper'

feature 'When a user visits a vending machine show page' do
  scenario 'they see the location of that machine' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")

    visit machine_path(dons)

    expect(page).to have_content("Don's Mixed Drinks Vending Machine")
  end

  it 'shows snacks and prices' do

    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    snack1 = Snack.create(name: 'doritos', price: 2.25)
    snack2 = Snack.create(name: 'snickers', price: 1.75)
    dons.snacks << snack1
    dons.snacks << snack2

    visit machine_path(dons)

    expect(page).to have_content(snack1.name)
    expect(page).to have_content(snack2.price)
  end
end
