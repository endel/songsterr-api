#
# Extend String to support #camelize method.
#
#  "active_record".camelize                # => "ActiveRecord"
#  "active_record".camelize(:lower)        # => "activeRecord"
#  "active_record/errors".camelize         # => "ActiveRecord::Errors"
#  "active_record/errors".camelize(:lower) # => "activeRecord::Errors"
#
class String
  def camelize(first_letter = :upper)
    parts = self.split('_')
    i = 0
    parts.collect! do |p|
      p = p.capitalize if (i != 0 || (i == 0 && first_letter == :upper))
      i += 1
      p
    end
    parts.join('')
  end
end unless "".respond_to? :camelize
