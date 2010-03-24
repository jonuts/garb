# These are pulled out of ActiveSupport

class String
  def camelize(first_letter_in_uppercase = :upper)
    if first_letter_in_uppercase == :upper
      gsub(/\/(.?)/) { "::#{$1.upcase}" }.gsub(/(?:^|_)(.)/) { $1.upcase }
    else
      self[0..0].downcase + camelize[1..-1]
    end
  end

  def underscore
    gsub(/::/, '/').
      gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2').
      gsub(/([a-z\d])([A-Z])/,'\1_\2').
      tr("-", "_").
      downcase
  end
end

