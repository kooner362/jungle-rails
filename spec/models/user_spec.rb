require 'rails_helper'

RSpec.describe User, type: :model do
  before :each do
    @user = User.new(
      first_name: 'Gurpreet',
      last_name: 'Kooner',
      email: 'kooner@gmail.com',
      password: 'testing',
      password_confirmation: 'testing'
    )
  end

  describe 'Validations' do
    it "is valid with valid attributes" do
      expect(@user).to be_valid
    end

    it "is not valid without a first_name" do
      @user.first_name = nil
      expect(@user).to_not be_valid
    end

    it "is not valid without a last_name" do
      @user.last_name = nil
      expect(@user).to_not be_valid
    end

    it "is not valid without an email" do
      @user.email = nil
      expect(@user).to_not be_valid
    end

    it "is not valid without matching passwords" do
      @user.password = nil
      @user.password_confirmation = 'testing'
      expect(@user).to_not be_valid
    end

    it "is not valid without having password of min length 6" do
      @user.password = 'test'
      @user.password_confirmation = 'test'
      expect(@user).to_not be_valid
    end
  end

  describe '.authenticate_with_credentials' do
    it "returns the user if succesfully logged in" do
      a = User.create(first_name: 'Gurpreet',last_name: 'Kooner',email: 'kooner@gmail.com',password: 'testing',password_confirmation: 'testing')
      b = User.create(first_name: 'Bob',last_name: 'Bobny',email: 'bob@gmail.com',password: 'testing',password_confirmation: 'testing')
      c = User.create(first_name: 'John',last_name: 'Doe',email: 'john@gmail.com',password: 'testing',password_confirmation: 'testing')

      user_a = User.authenticate_with_credentials(a.email, a.password)
      user_b = User.authenticate_with_credentials(b.email, b.password)
      user_c = User.authenticate_with_credentials(' joHn@gmail.com', c.password)
  
      expect(user_a.email.equal? a)
      expect(user_b.email.equal? b)
      expect(user_c.email.equal? c)

    end
  end
end
