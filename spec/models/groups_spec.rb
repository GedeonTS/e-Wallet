require 'rails_helper'

RSpec.describe Group, type: :model do
  before(:each) do
    @user = User.create!(name: 'MyUser', email: 'user@mail.com', password: '123456', password_confirmation: '123456')
    @group = Group.new(name: 'MyGroup', user_id: @user.id)
  end
  describe 'validations' do
    it 'is valid with valid attributes' do
      @group.save
      expect(@group).to be_valid
    end
    it 'is not valid without a name' do
      expect(Group.new).to_not be_valid
    end
  end

  describe 'associations' do
    it 'has many expenses' do
      assc = described_class.reflect_on_association(:expenses)
      expect(assc.macro).to eq :has_many
    end
    it 'belongs to users' do
      assc = described_class.reflect_on_association(:user)
      expect(assc.macro).to eq :belongs_to
    end
  end
end
