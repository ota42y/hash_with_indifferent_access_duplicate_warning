require 'active_support/hash_with_indifferent_access'

module HashWithIndifferentAccessDuplicateWarning::HashWithIndifferentAccess
  def initialize(constructor = {})
    super

    warning_duplicate_keys(constructor) if constructor.respond_to?(:to_hash)
  end

  private

  def warning_duplicate_keys(original)
    original.to_hash.keys.each do |k|
      # if string key and symbol key exist, show warning
      # (if symbol key exist, check there is string key we don't need other direction check)
      next unless k.is_a?(Symbol)

      converted_key = convert_key(k)
      next unless original.key?(converted_key)

      msg = "warning: key :#{k} and '#{converted_key}' is duplicated and overwritten"
      HashWithIndifferentAccessDuplicateWarning.write_error_log(msg)
    end
  end
end

::ActiveSupport::HashWithIndifferentAccess.prepend(HashWithIndifferentAccessDuplicateWarning::HashWithIndifferentAccess)
