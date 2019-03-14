class Ml
  def self.predict
  end

  def self.estimate_prices(property)
    predictions = 
      estimator.predict(
        property.number_of_beds,
        property.number_of_bathrooms,
        property.number_of_bedrooms,
        property.number_of_people,
        property.city
      )

    property.nightly_price = predictions["Nightly"]
    property.weeknight_price = predictions["Weeknight"]
    property.weekend_night_price = predictions["Weekend night"]
    property.weekly_price = predictions["Weekly"]
    property.monthly_price = predictions["Monthly"]

    property
  end

  def self.estimator
    @@estimator
  end

  def self.estimator=(estimator)
    @@estimator = estimator
  end
end
