class OrgsController < ApplicationController
  before_filter :authorize

  def new
  end

  def create
    @org = Org.new(org_params)
    @org.owner_id = current_user.id
    if @org.save
         @org.users << User.find_by_id(current_user)
         flash[:alert] =  "#{@org.name} #{@org.description} created."
         redirect_to @org
    else
      flash[:alert] = 'Something went wrong. Check your info.'
      @orgs = Org.all
      render 'orgs/index'
    end
    # render plain: @org.owner_id
  end

  def edit
  end

  def update
  end

  def index
    @orgs = Org.all
    @org = Org.new

  end

  def show
    # render plain: params[:id]
    @org= Org.find_by_id(params[:id])
    if @org && @org.users.find_by_id(current_user.id)
      render 'orgs/show_delete'
    else
      
    end


    # if destroy

    #   # render plain: 'includes'

    # else
    #   render 'orgs/show'
    # end




  end

  def destroy
  end
  def add_group_to_user
    # render plain:  params
    current_user.orgs << Org.find_by_id(params[:org_id]) if 
    # render plain: params[:org_id]
    redirect_to org_path(Org.find_by_id(params[:org_id]))
  end
  def delete_group_from_user
    # render plain: params
     org = current_user.orgs.find_by_id(params[:org_id])
     org.users.delete(User.find(current_user.id))
     redirect_to '/main'




  end

  private
    def org_params
      params.require(:org).permit(:name, :description)
    end

end
