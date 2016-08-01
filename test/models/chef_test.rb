require 'test_helper'

class ChefTest < ActiveSupport::TestCase

  def setup
    @chef = Chef.new(name: "john", email: "john@example.com")
  end

  test "chef should be valid" do 
    assert @chef.valid?
  end

  test "chef name should be present" do 
    @chef.name = ""
    assert_not @chef.valid?
  end

  test "name should not be too short" do 
    @chef.name = "x" * 2
    assert_not @chef.valid?
  end

  test "name should not be too long" do 
    @chef.name = "x" * 41
    assert_not @chef.valid?
  end

   test "email should be present" do 
    @chef.email = ""
    assert_not @chef.valid?
  end

  test "email should not be too short" do 
    @chef.email = "x" * 2
    assert_not @chef.valid?
  end

  test "email should not be too long" do 
    @chef.email = "x" * 101
    assert_not @chef.valid?
  end

  test "email should be unique" do 
    dup_chef = @chef.dup
    dup_chef.email = @chef.email.upcase
    @chef.save
    assert_not dup_chef.valid?
  end

  test "email should be valid" do 
    valid_addresses = %w[user@eee.com R_TDD-D5@eee.hello.org user@example.com]
    valid_addresses.each do |va|
      @chef.email = va
      assert @chef.valid?, "#{va.inspect} should be valid"
    end
  end

  test "invalid email address should be rejected" do 
    invalid_addresses = %w[user@eee,com R_TDD-D5@eee. user@example]
    invalid_addresses.each do |ia|
      @chef.email = ia
      assert_not @chef.valid?, "#{ia.inspect} should be invalid"
    end
  end

end
