class ApplicationRecord < ActiveRecord::Base
  # Mark this class as abstract to prevent it from being instantiated directly
  self.abstract_class = true

  # Register a callback to be called after the object is initialized
  after_initialize :set_defaults

  private

  # Define a private method to set default values for the model's attributes
  def set_defaults
    # If the published attribute is not set, default to false
    self.published ||= false
  end
end
