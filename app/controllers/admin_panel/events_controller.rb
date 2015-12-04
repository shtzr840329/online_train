class AdminPanel::EventsController < AdminPanel::BaseController
	load_and_authorize_resource
	before_action :set_breadcrumb

	def index
		@events = Event.all.page(params[:page]).per(10)
		add_breadcrumb "新闻列表"
	end

	def show
		add_breadcrumb "查看"
	end

	def new
		@event = Event.new
		add_breadcrumb "新建"
	end

	def create
		@event = Event.new(event_params)
		if @event.save
			flash[:notice] = "创建成功"
			return redirect_to admin_panel_events_path
		else
			flash[:notice] = "创建失败"
			return redirect_to admin_panel_events_path
		end
	end

	def edit
		add_breadcrumb "修改"
	end

	def destroy
		@event.destroy
		redirect_to admin_panel_events_path
	end

	def update
		if @event.update(event_params)
			flash[:notice] = "更新成功"
			return redirect_to admin_panel_events_path
		else
			flash[:notice] = "更新失败"
			return redirect_to admin_panel_events_path
		end
	end

	private
	def event_params
			params.require(:event).permit(:title, :classify, :content, :picture_url, :is_competition)
	end

	def set_event
		@event = Event.find(params[:id])
	end

end
