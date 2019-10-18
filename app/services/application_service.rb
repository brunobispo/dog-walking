class ApplicationService
  include ActiveModel::Validations
  include ActiveModel::Model

  private_class_method :new

  def self.call(*args)
    new(*args).tap(&:call)
  end

  def success?
    errors.empty?
  end
end
