require "pycall/import"
include PyCall::Import

class Ml::Estimator
  def initialize
    @pipeline = initialize_pipeline
    @estimator = initialize_estimator

    @all_periods = ["Monthly", "Nightly", "Weekend night", "Weekly", "Weeknight"]
  end

  def predict(num_bed, num_bathroom, num_bedroom, num_people, city)
    all_variants = @all_periods.map { |period| [num_bed, num_bathroom, num_bedroom, num_people, city, period] }

    prepared = @pipeline.transform(all_variants)
    predicted = @estimator.predict(prepared)
    @all_periods.each_with_index
      .each_with_object({}) { |(period, idx), result| result[period] = predicted[idx] }
  end

  def initialize_pipeline
    pyimport :pickle
    print "===> [PIPELINE] Initializing\n"
    pipeline_pkl = open("./ML/idx_pipeline.pickle", "rb")
    pickle.load(pipeline_pkl)
    print "===> [PIPELINE] Finished initializing\n"
  end

  def initialize_estimator
    pyimport :pickle
    print "===> [ESTIMATOR] Initializing\n"
    estimator_pkl = open("./ML/model.pickle", "rb")
    pickle.load(estimator_pkl)
    print "===> [ESTIMATOR] Finished initializing\n"
  end
end
