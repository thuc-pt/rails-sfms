class BookingRequestsController < ApplicationController
  before_action :authenticate_user!

  def index
    @pitch_bookings = Pitch.booking_request(current_user.id).map do |key, value|
      [key[0] << " [ " << value.to_s << " ]", key[1]]
    end
    @booking_request = @pitch_bookings.present? ? load_booking_request(@pitch_bookings.first[1]) : load_booking_request
  end

  def list_booking_by_params
    @booking_request = load_booking_request params[:pitch_id]
  end

  private

  def load_booking_request pitch_id = 0
    Booking.correct_condition(pitch_id).includes timesheet: :sub_pitch
  end
end
