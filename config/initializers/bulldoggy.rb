# TODO: change the gem to have this interface:
#Bulldoggy.config do |config|
  #config.plug_repository :tasks, TasksRepositoryAdapter
#end

Bulldoggy::Repository.register :task, TasksRepositoryAdapter.new
