require 'test_helper'

class PropertiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @property = properties(:one)
  end

  test "should get index" do
    get properties_url
    assert_response :success
  end

  test "should get new" do
    get new_property_url
    assert_response :success
  end

  test "should create property" do
    assert_difference('Property.count') do
      post properties_url, params: { property: { city: @property.city, monthly_price: @property.monthly_price, nightly_price: @property.nightly_price, number_of_bathrooms: @property.number_of_bathrooms, number_of_bedrooms: @property.number_of_bedrooms, number_of_beds: @property.number_of_beds, number_of_people: @property.number_of_people, weekend_night_price: @property.weekend_night_price, weekly_price: @property.weekly_price, weeknight_price: @property.weeknight_price } }
    end

    assert_redirected_to property_url(Property.last)
  end

  test "should show property" do
    get property_url(@property)
    assert_response :success
  end

  test "should get edit" do
    get edit_property_url(@property)
    assert_response :success
  end

  test "should update property" do
    patch property_url(@property), params: { property: { city: @property.city, monthly_price: @property.monthly_price, nightly_price: @property.nightly_price, number_of_bathrooms: @property.number_of_bathrooms, number_of_bedrooms: @property.number_of_bedrooms, number_of_beds: @property.number_of_beds, number_of_people: @property.number_of_people, weekend_night_price: @property.weekend_night_price, weekly_price: @property.weekly_price, weeknight_price: @property.weeknight_price } }
    assert_redirected_to property_url(@property)
  end

  test "should destroy property" do
    assert_difference('Property.count', -1) do
      delete property_url(@property)
    end

    assert_redirected_to properties_url
  end
end
