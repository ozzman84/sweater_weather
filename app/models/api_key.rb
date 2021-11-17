module ApiKey
  def self.generator
    SecureRandom.base64.tr('+/=', 'Qrt')
    # "sk_test_" + SecureRandom.urlsafe_base64
  end
end
