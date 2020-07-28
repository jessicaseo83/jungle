require 'rails_helper'

RSpec.describe User, type: :model do
  before :each do
    @user = User.new(first_name: "Pierce", last_name: "Brosnan", email: "james@bond.com", password: "GoldenEye", password_confirmation: "GoldenEye")
  end

  describe 'Validations' do
    it 'expects not valid if first_name is missing' do
      @user.first_name = nil
      expect(@user).not_to be_valid
    end

    it 'expects not valid if last_name is missing' do
      @user.last_name = nil
      expect(@user).not_to be_valid
    end

    it 'expects not valid if email is missing' do
      @user.email = nil
      expect(@user).not_to be_valid
    end

    it 'expects not valid if user tries to use an email already registered' do
      @user.save
      @badUser = User.new(first_name: "Daniel", last_name: "Craig", email: "james@bond.com", password: "casinoRoyale", password_confirmation: "casinoRoyale" )
      expect(@badUser).not_to be_valid
    end

    it 'expects not valid if password is missing' do
      @user.password = nil
      expect(@user).not_to be_valid
    end
    
    it 'expects not valid if the user types short password' do
      @user.password = "cool"
      expect(@user).not_to be_valid
    end

    it 'expects not valid if password_confirmation is missing' do
      @user.password_confirmation = nil
      expect(@user).not_to be_valid
    end
    it 'expects valid if first_name, last_name, email, password, and password_confirmation are provided' do
      expect(@user).to be_valid
    end
  end

  describe '.authenticate_with_crendentials' do
    it 'return user if email and password are matching' do
      @user.save
      expect(User.authenticate_with_credentials("james@bond.com", "GoldenEye")).not_to be_nil
    end

    it 'return user even if user types whitespace' do
      @user.save
      expect(User.authenticate_with_credentials("    james@bond.com", "GoldenEye")).not_to be_nil
    end

    it 'return user even if user types in the wrong case' do
      @user.save
      expect(User.authenticate_with_credentials("James@BoNd.CoM", "GoldenEye")).not_to be_nil
    end
  end

end
