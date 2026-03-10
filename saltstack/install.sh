#!/bin/bash

curl -o /tmp/bootstrap-salt.sh -L https://github.com/saltstack/salt-bootstrap/releases/latest/download/bootstrap-salt.sh
sudo sh /tmp/bootstrap-salt.sh -X 
