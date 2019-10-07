class V1::ShortLinksController < ApplicationController
  def show
    short_link = ShortLink.where(short_link: params[:id]).first
    if short_link.present?
      redirect_to short_link.long_url
    else
      response = { status: 'error', code: 404, message: 'Short link not found' }
      render json: response, status: :not_found
    end
  end

  def create
    return if short_link_present?

    short_link = ShortLink.new(short_link_params)
    if short_link.save
      render json: short_link
    else
      render json: short_link.errors, status: :unprocessable_entity
    end
  end

  private

  def short_link_present?
    short_link = ShortLink.where(long_url: params[:long_url]).first
    render json: short_link if short_link.present?
  end

  def short_link_params
    params.permit(:long_url)
  end
end
