# test/models/turkey_test.rb
require "test_helper"

class TurkeyTest < ActiveSupport::TestCase
  # Test for valid turkey creation
  test "should save turkey with valid attributes" do
    turkey = Turkey.new(name: "Tom", age: 5, weight: 15.0, sex: 'male', species: 'Rio Grande Turkey', status: 'wild')
    assert turkey.save, "Failed to save the turkey with valid attributes"
  end

  # Test for presence validation on name
  test "should not save turkey without name" do
    turkey = Turkey.new(age: 5, weight: 15.0, sex: 'male', species: 'Rio Grande Turkey', status: 'wild')
    assert_not turkey.save, "Saved the turkey without a name"
  end

  # Test for presence validation on age
  test "should not save turkey without age" do
    turkey = Turkey.new(name: "Tom", weight: 15.0, sex: 'male', species: 'Rio Grande Turkey', status: 'wild')
    assert_not turkey.save, "Saved the turkey without an age"
  end

  # Test for numericality validation on age
  test "should not save turkey with negative age" do
    turkey = Turkey.new(name: "Tom", age: -5, weight: 15.0, sex: 'male', species: 'Rio Grande Turkey', status: 'wild')
    assert_not turkey.save, "Saved the turkey with a negative age"
  end

  # Test for presence validation on weight
  test "should not save turkey without weight" do
    turkey = Turkey.new(name: "Tom", age: 5, sex: 'male', species: 'Rio Grande Turkey', status: 'wild')
    assert_not turkey.save, "Saved the turkey without a weight"
  end

  # Test for numericality validation on weight
  test "should not save turkey with negative weight" do
    turkey = Turkey.new(name: "Tom", age: 5, weight: -15.0, sex: 'male', species: 'Rio Grande Turkey', status: 'wild')
    assert_not turkey.save, "Saved the turkey with a negative weight"
  end

  # Test for presence validation on sex
  test "should not save turkey without a sex" do
    turkey = Turkey.new(name: "Tom", age: 5, weight: -15.0, species: 'Rio Grande Turkey', status: 'wild')
    assert_not turkey.save, "Saved the turkey without a sex"
  end

  # Test for inclusion validation on sex
  test "should not save turkey with invalid sex" do
    turkey = Turkey.new(name: "Tom", age: 5, weight: 15.0, sex: 'INVALID SEX', species: 'Rio Grande Turkey', status: 'InvalidStatus')
    assert_not turkey.save, "Saved the turkey with an invalid sex"
  end

  # Test for presence validation on species
  test "should not save turkey without a species" do
    turkey = Turkey.new(name: "Tom", age: 5, weight: -15.0, sex: 'male', status: 'wild')
    assert_not turkey.save, "Saved the turkey without a sex"
  end

  # Test for inclusion validation on species
  test "should not save turkey with invalid species" do
    turkey = Turkey.new(name: "Tom", age: 5, weight: 15.0, sex: 'male', species: 'INVALID SPECIES', status: 'InvalidStatus')
    assert_not turkey.save, "Saved the turkey with an invalid sex"
  end

  # Test for presence validation on status
  test "should not save turkey without status" do
    turkey = Turkey.new(name: "Tom", age: 5, weight: 15.0, sex: 'male', species: 'Rio Grande Turkey')
    assert_not turkey.save, "Saved the turkey without a status"
  end

  # Test for inclusion validation on status
  test "should not save turkey with invalid status" do
    turkey = Turkey.new(name: "Tom", age: 5, weight: 15.0, sex: 'male', species: 'Rio Grande Turkey', status: 'InvalidStatus')
    assert_not turkey.save, "Saved the turkey with an invalid status"
  end
end
