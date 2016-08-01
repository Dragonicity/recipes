require 'test_helper'

class RecipeTest < ActiveSupport::TestCase

  def setup
    @chef = Chef.create(name: "Mark", email: "Mark@example.com")
    @recipe = @chef.recipes.build(name: "Chicken parm", 
      summary: "The best chicken parm recipe ever",
      description: "Heat oil, add onions, add chicken, etc.")
  end

  test "recipe should be valid" do 
    assert @recipe.valid?
  end

  test "chef_id should be present" do 
    @recipe.chef_id = nil
    assert_not @recipe.valid?
  end

  test "name should be present" do 
    @recipe.name = ""
    assert_not @recipe.valid?
  end

  test "name should not be too short" do 
    @recipe.name = "x" * 4
    assert_not @recipe.valid?
  end

  test "name should not be too long" do 
    @recipe.name = "x" * 101
    assert_not @recipe.valid?
  end

  test "summary should be present" do 
    @recipe.summary = ""
    assert_not @recipe.valid?
  end

  test "summary should not be too short" do 
     @recipe.summary = "x" * 9
    assert_not @recipe.valid?
  end

  test "summary should not be too long" do 
    @recipe.summary = "x" * 151
    assert_not @recipe.valid?
  end

  test "description should be present" do 
    @recipe.description = ""
    assert_not @recipe.valid?
  end

  test "description should not be too short" do 
    @recipe.description = "x" * 19
    assert_not @recipe.valid?
  end

  test "description should not be too long" do 
    @recipe.description = "x" * 501
    assert_not @recipe.valid?
  end

end