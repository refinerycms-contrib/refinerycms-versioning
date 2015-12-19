Refinery::I18n.frontend_locales.each do |lang|
  I18n.locale = lang

  if defined?(Refinery::User)
    Refinery::User.all.each do |user|
      if user.plugins.find_by_name('refinery_versioning').nil?
        user.plugins.create(:name => "refinery_versioning",
                            :position => (user.plugins.maximum(:position) || -1) +1)
      end
    end
  end
end