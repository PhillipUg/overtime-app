namespace :notification do
  desc 'Sends SMS notification to employees asking them to log overtime or not'
  task sms: :environment do
    # 1. Schedule to run every sunday at 5pm
    # 2. Iterate over all employees
    # 3. Skip Admin Users
    # 4. Send a message that has instructions and a link to log overtime
  end

  desc 'Sends email notification to managers (admin users) asking them to review pending overtime requests'
  task manager_email: :environment do
    submitted_posts = Post.submitted
    admin_users = AdminUser.all

    if submitted_posts.count > 0
      admin_users.each do |admin|
        ManagerMailer.email(admin).deliver_now
      end
    end
  end
end
