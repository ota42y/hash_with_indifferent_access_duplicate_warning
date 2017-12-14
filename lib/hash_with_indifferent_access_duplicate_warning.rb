require "hash_with_indifferent_access_duplicate_warning/version"
require "hash_with_indifferent_access_duplicate_warning/active_support/hash_with_indifferent_access"

module HashWithIndifferentAccessDuplicateWarning
  attr_accessor :write_error_log_func

  class << self
    def write_error_log(error_message)
      @write_error_log_func&.call(error_message)
    end

    def register_write_error_log_func(func)
    @write_error_log_func = func
  end
  end
end
