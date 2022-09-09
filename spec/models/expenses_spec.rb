require 'rails_helper'

RSpec.describe Expense, type: :model do
  before(:each) do
    @user = User.create!(name: 'MyUser', email: 'user@mail.com', password: '123456', password_confirmation: '123456')
    @group = Group.create(name: 'MyGroup', user_id: @user.id)
    @expense = Expense.new(name: 'MyExpense', amount: 70, user_id: @user.id, group_id: @group.id)
  end
  describe 'validations' do
    it 'is valid with valid attributes' do
      @expense.save
      expect(@expense).to be_valid
    end
    it 'is not valid without a name' do
      expect(Expense.new).to_not be_valid
    end
  end

  describe 'associations' do
    it 'has many expenses' do
      assc = described_class.reflect_on_association(:group)
      expect(assc.macro).to eq :belongs_to
    end
    it 'belongs to users' do
      assc = described_class.reflect_on_association(:user)
      expect(assc.macro).to eq :belongs_to
    end
  end
end
