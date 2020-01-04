namespace :dev do

  DEFAULT_PASSWORD = "123456"
  
  desc "Setting development environments"
  task setup: :environment do
    if Rails.env.development?
      show_spinner("Dropping DB") { %x(rails db:drop) }
      show_spinner("Creating DB") { %x(rails db:create) }
      show_spinner("Migrating DB") { %x(rails db:migrate) }
      show_spinner("Cadastrando admin padrão") { %x(rails dev:add_default_admin) }
      show_spinner("Cadastrando admins extras") { %x(rails dev:add_extras_admin) }
      show_spinner("Cadastrando user padrão") { %x(rails dev:add_default_user) }
    else
      puts "You are not in development environment"
    end
  end

  desc "Adiciona o administrador padrão"
  task add_default_admin: :environment do
    Admin.create!(
      email: 'admin@admin.com',
      password: DEFAULT_PASSWORD,
      password_confirmation: DEFAULT_PASSWORD
    )
  end

  desc "Adiciona administradores extras"
  task add_extras_admin: :environment do
    10.times do |i|
      Admin.create!(
        email: Faker::Internet.email,
        password: DEFAULT_PASSWORD,
        password_confirmation: DEFAULT_PASSWORD
      )
    end
  end
    
  desc "Adiciona o usuário padrão"
  task add_default_user: :environment do
    User.create!(
      email: 'user@user.com',
      password: DEFAULT_PASSWORD,
      password_confirmation: DEFAULT_PASSWORD
    )
  end

  private

    def show_spinner(msg_start, msg_end = 'Done!')
      spinner = TTY::Spinner.new("[:spinner]#{msg_start}")
      spinner.auto_spin
      yield
      spinner.success("(#{msg_end})")
    end
end
