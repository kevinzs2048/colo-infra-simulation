external-deps:
	ansible-galaxy install --force -r install_roles.yml
firewall-hypervisors:
	ansible-playbook -vvv -b playbooks/deploy-firewall-hypervisor.yml -i ./hosts
firewall:
	ansible-playbook -K -vvvv playbooks/deploy-firewall.yml -i ./hosts
backup:
	ansible-playbook -vvvv -i ./hosts playbooks/network-config-backup.yml
vlan-switchport:
	ansible-playbook -vvvv -i ./hosts playbooks/switchport-vlan.yml --limit $(SWITCH) --extra-vars "switchport=$(PORT) vlan=$(VLAN)"
