require 'rails_helper'

feature 'user adds a new manufacturer', %Q{
  As a site visitor
  I want to add a manufacturer
  So that I can see all the manufcaturers in my lot
} do


  scenario "User creates a manufacturer" do

    visit '/manufacturers/new'

    attrs = {
      name: 'Honda',
      country_name: 'Japan'
    }

    manufacturer = Manufacturer.new(attrs)

    fill_in 'Name', with: manufacturer.name
    fill_in 'Country name', with: manufacturer.country_name
    click_on 'Submit'

    expect(page).to have_content 'Your manufacturer was submitted'
    expect(page).to have_content manufacturer.name
    expect(page).to have_content manufacturer.country_name
  end

  scenario "Empty Name" do

    visit '/manufacturers/new'

    attrs = {
      country_name: 'Japan'
    }

    manufacturer = Manufacturer.new(attrs)


    fill_in 'Country name', with: manufacturer.country_name
    click_on 'Submit'

    expect(page).to have_content "Name can't be blank"

  end

  scenario "Empty Country Name" do

    visit '/manufacturers/new'

    attrs = {
      name: 'Honda'
    }

    manufacturer = Manufacturer.new(attrs)


    fill_in 'Name', with: manufacturer.name
    click_on 'Submit'

    expect(page).to have_content "Country name can't be blank"

  end



end
