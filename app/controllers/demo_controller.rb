class DemoController < ApplicationController

  layout false

  def index
    #render ('index')
  end

  def hello
    @array = [1,2,3,4,5]
    @id = params['id']
    @page = params[:page]
    #render ('hello')
    #redirect_to(controller: 'demo', action: 'index')
  end

  def about
    render ('about_us')
  end

  def contact
    @country = params[:country]
    if @country == "us" || @country == "ca"
      @number = "(800) 555-6789"
    elsif @country == "uk"
      @number = "(020) 7946 1234"
    else
      @number = "+1 (987) 654-3210"
    end
    render ('contact_us')
  end

end
