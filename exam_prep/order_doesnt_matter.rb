class Oracle
  def predict_the_future
    "You will " + choices.sample
  end

  def choices
    ["eat a nice lunch", "take a nap soon", "stay at work late"]
  end
end

# note that when calling `predict_the_future` it will dip into the array
# in choices and select a random item
