require 'rails_helper'

RSpec.describe User, type: :view, js: true do
  before(:each) do
    @user = User.create(name: 'MyjUsesrd', email: 'gedeontshobohwa1@gmail.com', password: 'ddddddd')

    visit groups_path

    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Log In'
  end

  it 'It creates User successfully' do
    expect(User.all.length).to eq 1
  end

  it 'It should have no Group yet' do
    expect(page).to have_content('You have no groups yet')
  end
end
