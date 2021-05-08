# frozen_string_literal: true

require 'spec_helper'

describe Devise::Models::JwtAuthenticable do
  include_context 'fixtures'

  let(:model) { jwt_with_jti_matcher_model }
  let(:user) { jwt_with_jti_matcher_user }

  describe '#find_for_jwt_authentication(sub)' do
    it 'finds record which has given `sub` as `id`' do
      expect(model.find_for_jwt_authentication(user.id)).to eq(user)
    end

    it 'returns nil when user is not found' do
      expect(model.find_for_jwt_authentication('none')).to be_nil
    end
  end

  describe '#jwt_subject' do
    it 'returns id' do
      expect(user.jwt_subject).to eq(user.id)
    end
  end
end
