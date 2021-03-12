# Create a proper charm environment for juju
# Run first
# mkdir -p ~/charms
# mkdir -p ~/charms/layers
# mkdir -p ~/charms/interfaces

export JUJU_REPOSITORY=$HOME/charms

export CHARM_LAYERS_DIR=$JUJU_REPOSITORY/layers
# Directory containing local copies of interface layers
export CHARM_INTERFACES_DIR=$JUJU_REPOSITORY/interfaces
# Build charms will be placed into $CHARM_BUILD_DIR/{charm_name} (defaults to current directory)
export CHARM_BUILD_DIR=$JUJU_REPOSITORY/builds

