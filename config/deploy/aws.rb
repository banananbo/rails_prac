# 環境指定
set :rails_env, 'production'

# サーバー、ユーザー、ロールの指定
server "ec2-52-195-3-216.ap-northeast-1.compute.amazonaws.com", roles: %w{app db web}

set :deploy_to, "/home/ec2-user/captest"

# set :rbenv_ruby, '2.6.6'

# SSHの設定
set :ssh_options, {
    user: 'ec2-user',
    keys: %w(~/.ssh/aws_keys/obana_key.pem),
    forward_agent: true,
    auth_methods: %w(publickey)
}
