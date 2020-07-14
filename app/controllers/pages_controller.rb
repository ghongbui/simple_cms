class PagesController < ApplicationController

  #Returns list of pages
  def index
    @pages = Page.order('POSITION ASC')
  end

  #Returns one single page
  def show
    @page = Page.find(params[:id])
  end

  #Instantiate an empty page
  def new
    @page = Page.new
  end

  #Create a new page with given parameters
  #Redirect to a list of all pages if succeeds
  #Render the form again if there were errors
  def create
    @page = Page.new(page_params)
    if @page.save
      redirect_to(pages_path)
    else
      render ('new')
    end
  end

  #Display form and allow to edit a page
  def edit
    @page = Page.find(params[:id])
  end

  #Updates a page based on given parameters
  #Redirects to the page update if succeeds
  def update
    @page = Page.find(params[:id])
    if @page.update(page_params)
      redirect_to(page_path(@page))
    else
      render ('edit')
    end
  end

  #Finds the page that needs deleting
  def delete
    @page = Page.find(params[:id])
  end

  #Finds page specified and destroy it
  def destroy
    @page = Page.find(params[:id])
    @page.destroy
    redirect_to(pages_path)
  end

  private

  #Helper method to ensures the given parameters are strong and safe
  def page_params
    params.require(:page).permit(:subject_id, :name, :position, :visible, :permalink, :content)
  end

end
