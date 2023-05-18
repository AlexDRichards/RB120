class Oracle
  def predict_the_future
    "You will " + choices.sample
  end

  def choices
    ["eat a nice lunch", "take a nap soon", "stay at work late"]
  end
end

class RoadTrip < Oracle
  def choices
    ["visit Vegas", "fly to Fiji", "romp in Rome"]
  end
end

#trip = RoadTrip.new
# trip.predict_the_future #???

# because trip is an instance of RoadTrip, when predict_the_future is called
# it will look in RoadTrip first for the method choices
# if there were no method choices in RoadTrip, the choices in Oracle would trigger
# and you'd see them in the output.