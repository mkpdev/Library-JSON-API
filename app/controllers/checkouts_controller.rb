class CheckoutsController < ApplicationController
  before_action :authorize_request

  def create
    @checkout = @current_user.checkouts.new(checkout_params)
    @checkout.assigned_at = DateTime.now
    @checkout.status      = 0 # assigned
    authorize @checkout

    if @checkout.save
      render json: @checkout, status: :created, location: @checkout
    else
      render json: @checkout.errors, status: :unprocessable_entity
    end
  end

  def update
    @checkout = @current_user.checkouts.find(params[:id])

    if @checkout.update(return_at: DateTime.now, status: 1)
      render json: @checkout, location: @checkout
    else
      render json: @checkout.errors, status: :unprocessable_entity
    end
  end

  private

  def checkout_params
    params.permit(:book_id)
  end
end
