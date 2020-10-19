external-deps:
	ansible-galaxy install --force -r install_roles.yml
firewall-hypervisors:
	ansible-playbook -K -vvv playbooks/deploy-firewall-hypervisor.yml -i ./hosts
firewall:
	ansible-playbook -K -vvvv playbooks/deploy-firewall.yml -i ./hosts
vpn:
	ansible-playbook -vvvv -i ./hosts playbooks/vpn-create-users.yml
backup:
	ansible-playbook -vvvv -i ./hosts playbooks/network-config-backup.yml
vlan-switchport:
	ansible-playbook -vvvv -i ./hosts playbooks/switchport-vlan.yml --limit $(SWITCH) --extra-vars "switchport=$(PORT) vlan=$(VLAN)"
