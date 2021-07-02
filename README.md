# ias-example

    sudo apt-get install awscli
    "install terraform"
    aws configure
    terraform init
    terraform plan
    terraform apply

    ansible all -i hosts -m ping
    ansible all -i hosts -m shell -a 'sudo apt update'
    ansible-playbook provisioning.yml -i hosts
    ansible all -i hosts -m shell -a 'sudo reboot'

    terraform destroy