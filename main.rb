require "sinatra"
require "sinatra/reloader"
require "sinatra/activerecord"

ActiveRecord::Base.establish_connection(
	:adapter => 'postgresql',
	:host => 'localhost',
	:username => 'cstewa',
	:password => ' ',
	:database => 'todo',
	:encoding => 'utf8'
)

require_relative "task"

get "/" do
	@tasks = Task.all
	erb :index
end

get "/add_task" do
	erb :add_task
end

post "/add_task" do 
	@task = Task.new(:name => params[:task_name])
	@task.save
	erb :add_task
end 

post "/mark_done/:task_id" do
	@task = Task.find_by_id(params[:task_id])
	@task.update_attributes(:complete => "t")
	redirect "/"
end

	






	