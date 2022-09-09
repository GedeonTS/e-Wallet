require 'rails_helper'

RSpec.describe Expense, type: :view, js: true do
  before(:each) do
    @user = User.create(name: 'MyjUsesrd', email: 'gedeontshobohwa1@gmail.com', password: 'ddddddd')
    @group = @user.groups.create(name: 'Bread',
                                 icon: 'default.png')

    visit groups_path

    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Log In'
    click_link 'Bread'
  end

  it 'It creates User successfully' do
    expect(User.all.length).to eq 1
  end

  it 'It creates Group successfully' do
    expect(@group).to be_valid
  end

  it 'Should have no expense yet' do
    expect(page).to have_content('You have no expenses yet')
  end

  it 'Should display total expenses should be 0' do
    expect(page).to have_content('$ 0')
  end

  it 'Should create new expense' do
    @expense = Expense.create(name: 'food', amount: 100, group_id: @group.id, user_id: @user.id)
    expect(@expense).to be_valid
  end

  it 'Should create new expense' do
    @expense = Expense.create(name: 'food', amount: 100, group_id: @group.id, user_id: @user.id)
    visit group_expenses_path(@group)
    expect(page).to have_content('food')
  end

  it 'Should show total expenses' do
    @expense = Expense.create(name: 'food', amount: 100, group_id: @group.id, user_id: @user.id)
    visit group_expenses_path(@group)
    expect(page).to have_content('$ 100')
  end

  it 'Should show total expenses' do
    @expense = Expense.create(name: 'food', amount: 100, group_id: @group.id, user_id: @user.id)
    visit groups_path
    expect(page).to have_content('$100')
  end
end
