class TasksRepositoryAdapter
  # NOTE: could include an adapter interface that is defined on the gem
  # include Bulldoggy::Repositories::TasksAdapterInterface
  def all
    Task.all.map { |task| serialize(task) }
  end

  def count
    Task.count
  end

  # TODO: handle case when some validation goes wrong
  def save(task)
    serialize Task.create(description: task.description, done: task.done)
  end

  def check(id)
    task = Task.find(id)
    return :task_not_found unless task
    task.update(:done => true)
    serialize task
  end

  def uncheck
    task = Task.find(id)
    return :task_not_found unless task
    task.update(:done => false)
    serialize task
  end

  def find(id)
    serialize Task.find(id)
  end

  def delete_all
    Task.delete_all
  end

  def delete(id)
    Task.find(id).destroy
  end

  private

  def serialize(task)
    entity = Bulldoggy::Entities::Task.new(task.description, task.done)
    # TODO: move id setting elsewhere
    entity.id = task.id
    entity
  end
end
