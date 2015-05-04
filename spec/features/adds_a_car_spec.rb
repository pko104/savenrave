require 'rails_helper'

feature 'user adds a car', %Q{
  As a user I want to be able
  to add a car to a manufacturer
  so I can see all the cars that belong to the manufacturer
} do

  before(:each) do

    visit '/manufacturers/new'

    attrs = {
      name: 'Honda',
      country_name: 'Japan'
    }

    manufacturer = Manufacturer.new(attrs)
    manufacturer.save
    @m_id = manufacturer.id

    fill_in 'Name', with: manufacturer.name
    fill_in 'Country name', with: manufacturer.country_name
    click_on 'Submit'

  end

  scenario "User adds a car" do

    visit new_manufacturer_car_path(@m_id)

    attrs = {
      color: 'Red',
      year: '1955',
      mileage: '5000',
      description: 'Something',
    manufacturer_id: @m_id}

    car = Car.new(attrs)

    fill_in 'Color', with: car.color
    fill_in 'Year', with: car.year
    fill_in 'Mileage', with: car.mileage
    fill_in 'Description', with: car.description
    click_on 'Submit'

    expect(page).to have_content 'Your car was submitted'
    expect(page).to have_content car.color
    expect(page).to have_content car.year
    expect(page).to have_content car.mileage
    expect(page).to have_content car.description
  end

  scenario "Missing color field" do

    visit new_manufacturer_car_path(@m_id)

    attrs = {
      year: '1955',
      mileage: '5000',
      description: 'Something',
    manufacturer_id: @m_id}

    car = Car.new(attrs)

    fill_in 'Year', with: car.year
    fill_in 'Mileage', with: car.mileage
    fill_in 'Description', with: car.description
    click_on 'Submit'

    expect(page).to have_content "Color can't be blank"
  end

    scenario "Mileage is below 1920" do

    visit new_manufacturer_car_path(@m_id)

    attrs = {
      color: 'Red',
      year: '1901',
      mileage: '5000',
      description: 'Something',
    manufacturer_id: @m_id}

    car = Car.new(attrs)

    fill_in 'Color', with: car.color
    fill_in 'Year', with: car.year
    fill_in 'Mileage', with: car.mileage
    fill_in 'Description', with: car.description
    click_on 'Submit'

    expect(page).to have_content "Year must be greater than or equal to 1920"
  end

    scenario "Mileage field is missing" do

    visit new_manufacturer_car_path(@m_id)

    attrs = {
      color: 'Red',
      year: '1955',
      description: 'Something',
    manufacturer_id: @m_id}

    car = Car.new(attrs)

    fill_in 'Color', with: car.color
    fill_in 'Year', with: car.year
    fill_in 'Description', with: car.description
    click_on 'Submit'

    expect(page).to have_content "Mileage can't be blank"
  end

  scenario "Everything is blank" do

    visit new_manufacturer_car_path(@m_id)

    attrs = {
    manufacturer_id: @m_id}

    car = Car.new(attrs)

    click_on 'Submit'

    expect(page).to have_content "Mileage can't be blank"
    expect(page).to have_content "Year is not a number"
    expect(page).to have_content "Color can't be blank"
  end

end
