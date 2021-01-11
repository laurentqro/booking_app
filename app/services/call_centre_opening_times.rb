class CallCentreOpeningTimes
  SLOTS = {
    sunday: [],
    monday: %w[11:00 17:30],
    tuesday: %w[09:00 17:30],
    wednesday: %w[09:00 17:30],
    thursday: %w[09:00 20:00],
    friday: %w[09:00 20:00],
    saturday: %w[09:00 12:30],
  }

  INTERVAL_IN_MINUTES = 45

  def initialize(string_date)
    @date = DateTime.parse(string_date).utc
    @dayname = SLOTS.keys[@date.wday]
  end

  def slots
    {
      date: @date.strftime('%F'),
      slots: {
        first: SLOTS[@dayname].first,
        last: SLOTS[@dayname].last
      },
      interval: "00:#{INTERVAL_IN_MINUTES}"
    }
  end

  def next_available_slot
    {
      requested_date_time: @date,
      next_available_slot: get_next_available_slot
    }
  end

  private

  def get_next_available_slot
    return first_slot_of_day   if before_hours?
    return first_slot_next_day if after_hours?

    next_slot_of_the_day
  end

  def next_slot_of_the_day
    Time.at((@date.to_f / INTERVAL_IN_MINUTES.minutes).ceil * INTERVAL_IN_MINUTES.minutes).utc
  end

  def first_slot_of_day
    DateTime.parse("#{@date.year}-#{@date.month}-#{@date.day}T#{SLOTS[@dayname].first}")
  end

  def first_slot_next_day
    next_day = @date.next_day
    next_day_name = SLOTS.keys[next_day.wday]

    DateTime.parse("#{next_day.year}-#{next_day.month}-#{next_day.day}T#{SLOTS[next_day_name].first}")
  end

  def before_hours?
    next_slot_of_the_day < opening_time
  end

  def after_hours?
    next_slot_of_the_day >= closing_time
  end

  def opening_time
    DateTime.parse("#{@date.year}-#{@date.month}-#{@date.day}T#{SLOTS[@dayname].first}")
  end

  def closing_time
    DateTime.parse("#{@date.year}-#{@date.month}-#{@date.day}T#{SLOTS[@dayname].last}")
  end
end

