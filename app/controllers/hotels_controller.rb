# frozen_string_literal: true

class HotelsController < ApplicationController
  before_action :set_hotel, only: %i[show edit update destroy]
  helper_method :star_rating
  def index
    @city_options = %w[台北市 新北市]
    @hotel_type_options = %w[飯店 民宿 青年旅館 度假村 日租套房 奢華酒店]
    @equipment_options = %w[無線網路(WIFI) 停車場/停車位 早餐服務 酒吧/餐廳 會議室/會議設施 健身中心 可攜帶寵物 行李存放 乾洗服務 腳踏車租賃 24小時櫃檯接待]

    @address = params[:address] || []
    @hotel_types = params[:hotel_types] || []
    @equipment = params[:equipment] || []

    @hotels = if params[:keyword].present?
                Hotel.search(params[:keyword]).order(updated_at: :desc).page(params[:page])
              elsif @address.present? || @hotel_types.present? || @equipment.present?
                Hotel.filter(@address, @hotel_types, @equipment).order(updated_at: :desc).page(params[:page])
              else
                Hotel.order(updated_at: :desc).page(params[:page])
              end
    flash.now[:alert] = '沒有找到符合條件的飯店' and return if @hotels.empty?
  end

  def new
    @hotel = Hotel.new
  end

  def create
    @hotel = Hotel.new(hotel_parames)
    if @hotel.save
      redirect_to hotels_path, notice: '新增成功!'
    else
      render :new
    end
  end

  def show
    @comment = Comment.new
    @comments = @hotel.comments
  end
  

  def edit; end

  def update
    if @hotel.update(hotel_parames)
      redirect_to hotel_path(@hotel), notice: '更新成功!'
    else
      render :edit
    end
  end

  def destroy
    @hotel.destroy
    redirect_to hotels_path, notice: '已刪除!'
  end

  private

  def set_hotel
    @hotel = Hotel.friendly.find(params[:id])
  end

  def hotel_parames
    params.require(:hotel).permit(:name, :website, :star_rating, :address, :tel, :latitude, :longitude, :intro, :image,
                                  :hotel_types, equipment: [], images: [],)
  end
  def star_rating(rating)
    stars = ''
    if rating.present?
      rating.to_i.times { stars += '<i class="fas fa-star" style="color: #fbbf24;"></i>' }
      (5 - rating.to_i).times { stars += '<i class="fas fa-star" style="color: #d8d8d8;"></i>' }
    else
      5.times { stars += '<i class="fas fa-star" style="color: #d8d8d8;"></i>' }
    end
    stars.html_safe
  end
end
