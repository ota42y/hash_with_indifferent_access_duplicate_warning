require 'spec_helper'

RSpec.describe HashWithIndifferentAccessDuplicateWarning do
  it 'has a version number' do
    expect(HashWithIndifferentAccessDuplicateWarning::VERSION).not_to be nil
  end

  it 'correct convert' do
    d = double
    allow(d).to receive(:write)

    HashWithIndifferentAccessDuplicateWarning.register_write_error_log_func(proc { |msg| d.write(msg) })

    allow_any_instance_of(::ActiveSupport::HashWithIndifferentAccess).to receive(:warning_duplicate_keys)

    hash = ::ActiveSupport::HashWithIndifferentAccess.new(a: 'a', 'a' => 'b')
    expect(hash['a']).to eq('b')
    expect(d).to have_received(:write).once
  end
end
