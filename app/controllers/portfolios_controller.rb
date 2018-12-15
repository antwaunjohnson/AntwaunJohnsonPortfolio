class PortfoliosController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_portfolio_item, only: [:edit, :update, :show,  :destroy]
  layout 'portfolio'

  access all: [:show, :index], user: {except: [:destroy, :new, :create, :update, :edit]}, site_admin: :all


  def index
    @portfolio_items = Portfolio.by_position
  end

  def sort
    params[:order]. each do |key, value|
      Portfolio.find(value[:id]).update(position: value[:position])
    end

    render body: nil
  end

  def new
    @portfolio_item = Portfolio.new
    3.times { @portfolio_item.technologies.build}
  end

  def create
    @portfolio_item = Portfolio.new(portfolio_params)

    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to portfolios_path, notice: 'Your portfolio item is now live!' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @portfolio_item.update(portfolio_params)
        format.html { redirect_to portfolios_path, notice: 'This portfolio item has been successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

def show
end

def destroy
  @portfolio_item.destroy
  respond_to do |format|
    format.html { redirect_to portfolis_url, notice: 'Record was obliterated!' }
  end
end

private

def portfolio_params
    params.require(:portfolio).permit(:title,
                                   :subtitle,
                                   :body,
                                   technologies_attributes: [:name]
                                   )

end

def set_portfolio_item
    @portfolio_item = Portfolio.find(params[:id])
end

end
