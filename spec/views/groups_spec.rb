require 'rails_helper'

RSpec.describe Group, type: :view, js: true do
  before(:each) do
    @user = User.create(name: 'MyjUsesrd', email: 'gedeontshobohwa1@gmail.com', password: 'ddddddd')
    @group = @user.groups.create(name: 'Bread',
                                 icon: 'default.png')

    visit groups_path

    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Log In'
  end

  it 'It creates User successfully' do
    expect(User.all.length).to eq 1
  end

  it 'It creates Group successfully' do
    expect(@group).to be_valid
  end

  it 'Should display Group name' do
    visit groups_path
    expect(page).to have_content('Bread')
  end

  it 'Should display Group total spent money' do
    visit groups_path
    expect(page).to have_content('$')
  end

  it 'Should total group expenses should be 0' do
    visit groups_path
    expect(page).to have_content('$0')
  end
end
