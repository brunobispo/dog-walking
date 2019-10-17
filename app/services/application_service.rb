class ApplicationService
  include ActiveModel::Validations

  private_class_method :new

  def self.call(*args)
    new(*args).tap(&:call)
  end
end
